//
//  URLSessionConfiguration+Init.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

extension URLSessionConfiguration {
    
    // MARK: - Factories
    
    class func photoLibrary() -> URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        return config
    }
    
}
