//
//  APIServiceProtocol.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation
import Combine

protocol APIServiceProtocol {
    
    func fetchUsers() -> AnyPublisher<[User], Error>
    func fetchAlbums(for userId: String) -> AnyPublisher<[PhotoAlbum], Error>
    func fetchPhotos(for albumId: String) -> AnyPublisher<[Photo], Error>
    
}
