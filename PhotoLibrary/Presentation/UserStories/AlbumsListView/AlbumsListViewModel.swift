//
//  AlbumsListViewModel.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation
import Combine

final class AlbumsListViewModel: ObservableObject {
    
    // MARK: Stored Properties
    
    private let photoLibraryService: PhotoLibraryServiceProtocol
    private let userId: Int
    private var cancellableSet: Set<AnyCancellable> = []
    @Published var dataSource = [AlbumDataCell]()
    let navigationTitle = "Albums"
    
    // MARK: Init
    
    init(photoLibraryService: PhotoLibraryServiceProtocol, userId: Int) {
        self.photoLibraryService = photoLibraryService
        self.userId = userId
        if let albums = photoLibraryService.photoAlbums(by: userId) {
            fetchAlbumDataCell(albums)
        }
    }
    
    deinit {
        cancellableSet.forEach { $0.cancel() }
    }
    
}

// MARK: - View Model

extension AlbumsListViewModel {
    
    var dataSourceIsLoaded: Bool { !dataSource.isEmpty }
    
    func userId(for albumDataCell: AlbumDataCell) -> Int {
        let index = dataSource.firstIndex(of: albumDataCell) ?? 0
        return photoLibraryService.users[index].id
    }
    
    func performOnAppear() {
        guard dataSource.isEmpty else { return }
        updateAlbums()
    }
    
}

// MARK: - Helpers

private extension AlbumsListViewModel {
    

    func updateAlbums() {
        photoLibraryService.fetchAlbums(for: userId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (completion) in
                guard case let .failure(error) = completion else { return }
                self?.handleRequest(error: error)
            } receiveValue: { [weak self] (albums) in
                self?.fetchAlbumDataCell(albums)
            }
            .store(in: &cancellableSet)
    }
    
    func fetchAlbumDataCell(_ albums: [PhotoAlbum]) {
        let currentUserId = userId
        dataSource = albums.map { AlbumDataCell(id: $0.id, userId: currentUserId, name: $0.title, imageType: .folder) }
    }
    
    func handleRequest(error: Error) {
        guard let applicationError = error.applicationError else {
            print(error.localizedDescription)
            return
        }
        print(applicationError.localizedDescription)
    }
    
}
