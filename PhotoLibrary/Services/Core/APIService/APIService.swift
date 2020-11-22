//
//  APIService.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation
import Combine

final class APIService {
    
    // MARK: Stored Properties
    
    private let executor: RequestExecutor
    private let builder: RequestBuilder

    // MARK: Init
    
    init(settingsService: AppSettingsServiceProtocol) {
        let errorHandler = ResponseErrorHandler(successStatusCode: settingsService.successHttpStatusCodes,
                                                responseLoggingEnabled: settingsService.isResponseLoggingEnabled)
        builder = RequestBuilder(baseURL: settingsService.baseURL)
        executor = RequestExecutor(session: .init(configuration: .photoLibrary()),
                                   errorHandler: errorHandler,
                                   requestLoggingEnabled: settingsService.isRequestLoggingEnabled,
                                   responseLoggingEnabled: settingsService.isResponseLoggingEnabled)
    }
    
}

// MARK: - APIService

extension APIService: APIServiceProtocol {
    
    func fetchUsers() -> AnyPublisher<[User], Error> {
        return executor.promiseArrayQuery(builder.users())
    }
    
    func fetchAlbums(for userId: String) -> AnyPublisher<[PhotoAlbum], Error> {
        return executor.promiseArrayQuery(builder.albums(for: userId))
    }
    
    func fetchPhotos(for albumId: String) -> AnyPublisher<[Photo], Error> {
        return executor.promiseArrayQuery(builder.photos(for: albumId))
    }
    
}
