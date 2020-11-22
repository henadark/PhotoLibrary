//
//  PhotosGridViewModel.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation
import Combine

final class PhotosGridViewModel: ObservableObject {
    
    // MARK: Stored Properties
    
    private let photoLibraryService: PhotoLibraryServiceProtocol
    private let userId: Int
    private let albumId: Int
    private var cancellableSet: Set<AnyCancellable> = []
    @Published var dataSource = [Photo]()
    let navigationTitle = "Photos"
    
    // MARK: Init
    
    init(photoLibraryService: PhotoLibraryServiceProtocol, userId: Int, albumId: Int) {
        self.photoLibraryService = photoLibraryService
        self.userId = userId
        self.albumId = albumId
        if let photos = photoLibraryService.photos(by: userId, albumId: albumId) {
            dataSource = photos
        }
    }
    
    deinit {
        cancellableSet.forEach { $0.cancel() }
    }
    
}

// MARK: - View Model

extension PhotosGridViewModel {
    
    var dataSourceIsLoaded: Bool { !dataSource.isEmpty }
    
    func performOnAppear() {
        guard dataSource.isEmpty else { return }
        updatePhotos()
    }
    
}

// MARK: - Helpers

private extension PhotosGridViewModel {

    func updatePhotos() {
        photoLibraryService.fetchPhotos(for: userId, albumId: albumId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (completion) in
                guard case let .failure(error) = completion else { return }
                self?.handleRequest(error: error)
            } receiveValue: { [weak self] (photos) in
                self?.dataSource = photos
            }
            .store(in: &cancellableSet)
    }
    
    func handleRequest(error: Error) {
        guard let applicationError = error.applicationError else {
            print(error.localizedDescription)
            return
        }
        print(applicationError.localizedDescription)
    }
    
}
