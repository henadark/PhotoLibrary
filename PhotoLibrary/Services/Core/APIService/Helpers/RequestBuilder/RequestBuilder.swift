//
//  RequestBuilder.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

protocol Route {
    
    var path: String { get }
    
}

struct RequestBuilder {
    
    // MARK: - Stored Properties
    
    private let baseURL: String
    
    // MARK: - Init
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    // MARK: -  Requests
    
    func absoluteURL(route: Route, queryItems: [URLQueryItem] = []) -> URL? {
        let endpoint = baseURL + route.path
        guard let url = URL(string: endpoint), var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        urlComponents.queryItems = queryItems
        return urlComponents.url
    }
    
    func getRequest(for url: URL?) -> URLRequest? {
        guard let url = url else { return nil }
        return URLRequest(url: url)
    }
    
}
