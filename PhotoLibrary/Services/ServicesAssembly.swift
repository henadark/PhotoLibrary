//
//  ServicesAssembly.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

final class ServicesAssembly: ServicesAssemblyProtocol {
    
    // MARK: - Stored Properties
    
    let settingsService: AppSettingsServiceProtocol
    let apiService: APIServiceProtocol
    let photoLibraryService: PhotoLibraryServiceProtocol
    
    // MARK: - Init
    
    init() {
        settingsService = AppSettingsService(defaultSettings: AppDefaultSettings())
        apiService = APIService(settingsService: settingsService)
        photoLibraryService = PhotoLibraryService(settings: settingsService, apiService: apiService)
    }
    
}
