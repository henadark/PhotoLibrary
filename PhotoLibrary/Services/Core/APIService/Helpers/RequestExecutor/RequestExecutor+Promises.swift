//
//  RequestExecutor+Promises.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation
import Combine

extension RequestExecutor {
    
    func promiseQuery<T: Codable>(_ request: URLRequest?) -> AnyPublisher<T, Error> {
        guard let request = request else {
            return Fail(error: ApplicationError.urlError(URLError(.unsupportedURL))).eraseToAnyPublisher()
        }
        return runRequest(request)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func promiseArrayQuery<T: Codable>(_ request: URLRequest?) -> AnyPublisher<[T], Error> {
        guard let request = request else {
            return Fail(error: ApplicationError.urlError(URLError(.unsupportedURL))).eraseToAnyPublisher()
        }
        return runRequest(request)
            .decode(type: [T].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
}
