//
//  PhotoLibraryBuilder.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

extension RequestBuilder {
    
    // MARK: - Routes
    
    private enum PhotoLibraryRoutes: String, Route {

        case users
        case albums
        case photos

        var path: String {
            return self.rawValue
        }
        
    }
    
    // MARK: - Keys
    
    private enum URLQueryItemKeys: String {

        case userId
        case albumId
        
    }
    
    // MARK: - Building
    
    func users() -> URLRequest? {
        let url = absoluteURL(route: PhotoLibraryRoutes.users)
        return getRequest(for: url)
    }
    
    func albums(for userId: String) -> URLRequest? {
        let queryItems: [URLQueryItem] = [.init(name: URLQueryItemKeys.userId.rawValue, value: userId)]
        let url = absoluteURL(route: PhotoLibraryRoutes.albums, queryItems: queryItems)
        return getRequest(for: url)
    }
    
    func photos(for albumId: String) -> URLRequest? {
        let queryItems: [URLQueryItem] = [.init(name: URLQueryItemKeys.albumId.rawValue, value: albumId)]
        let url = absoluteURL(route: PhotoLibraryRoutes.photos, queryItems: queryItems)
        return getRequest(for: url)
    }
    
}
