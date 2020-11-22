//
//  PhotoLibraryServiceProtocol.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation
import Combine

protocol PhotoLibraryServiceProtocol {
    
    var users: [User] { get }
    func photoAlbums(by userId: Int) -> [PhotoAlbum]?
    func photos(by userId: Int, albumId: Int) -> [Photo]?
    func fetchUsers() -> AnyPublisher<[User], Error>
    func fetchAlbums(for userId: Int) -> AnyPublisher<[PhotoAlbum], Error>
    func fetchPhotos(for userId: Int, albumId: Int) -> AnyPublisher<[Photo], Error>
    
}
