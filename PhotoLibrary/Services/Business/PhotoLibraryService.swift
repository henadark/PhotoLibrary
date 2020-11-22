//
//  PhotoLibraryService.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation
import Combine

final class PhotoLibraryService {
    
    // MARK: Stored Properties
    
    private let settings: AppSettingsServiceProtocol
    private let apiService: APIServiceProtocol
    private var cancellableSet: Set<AnyCancellable> = []
    private(set) var users = [User]()
    
    // MARK: Init
    
    init(settings: AppSettingsServiceProtocol, apiService: APIServiceProtocol) {
        self.settings = settings
        self.apiService = apiService
    }
    
    deinit {
        cancellableSet.forEach { $0.cancel() }
    }
    
}

// MARK: - PhotoLibraryServiceProtocol

extension PhotoLibraryService: PhotoLibraryServiceProtocol {
    
    
    func photoAlbums(by userId: Int) -> [PhotoAlbum]? {
        guard let user = users.first(where: { $0.id == userId }) else { return nil }
        return user.photoAlbumbs
    }
    
    func photos(by userId: Int, albumId: Int) -> [Photo]? {
        guard let user = users.first(where: { $0.id == userId }), let album = user.photoAlbumbs?.first(where: { $0.id == userId }) else { return nil }
        return album.photos
    }
    
    func fetchUsers() -> AnyPublisher<[User], Error> {
        let future = Future<[User], Error> { [unowned self] promise in
            self.apiService.fetchUsers().sink(receiveCompletion: { (completion) in
                if case let .failure(error) = completion {
                    promise(.failure(error))
                }
            }) { [unowned self] (newUsers) in
                self.users = newUsers
                promise(.success(newUsers))
            }
            .store(in: &self.cancellableSet)
        }
        .eraseToAnyPublisher()
        return future
    }
    
    func fetchAlbums(for userId: Int) -> AnyPublisher<[PhotoAlbum], Error> {
        let future = Future<[PhotoAlbum], Error> { [unowned self] promise in
            self.apiService.fetchAlbums(for: userId.description)
                .sink(receiveCompletion: { (completion) in
                if case let .failure(error) = completion {
                    promise(.failure(error))
                }
            }) { [unowned self] (albums) in
                self.appendAlbums(albums, for: userId)
                promise(.success(albums))
            }
            .store(in: &self.cancellableSet)
        }
        .eraseToAnyPublisher()
        return future
    }
    
    func fetchPhotos(for userId: Int, albumId: Int) -> AnyPublisher<[Photo], Error> {
        let future = Future<[Photo], Error> { [unowned self] promise in
            self.apiService.fetchPhotos(for: albumId.description)
                .sink(receiveCompletion: { (completion) in
                if case let .failure(error) = completion {
                    promise(.failure(error))
                }
            }) { [unowned self] (photos) in
                self.appendPhotos(photos, for: userId, albumsId: albumId)
                promise(.success(photos))
            }
            .store(in: &self.cancellableSet)
        }
        .eraseToAnyPublisher()
        return future
    }
    
}

// MARK: - Helpers

private extension PhotoLibraryService {
    
    func appendAlbums(_ albums: [PhotoAlbum], for userId: Int) {
        guard let user = users.first(where: { $0.id == userId }) else { return }
        user.photoAlbumbs = albums
    }
    
    func appendPhotos(_ photos: [Photo], for userId: Int, albumsId: Int) {
        guard let user = users.first(where: { $0.id == userId }), let album = user.photoAlbumbs?.first(where: { $0.id == userId }) else { return }
        album.photos = photos
    }
    
}
