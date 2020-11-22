//
//  AppSettingsService.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

final class AppSettingsService {
    
    // MARK: Stored Properties
    
    private let defaults: AppDefaultSettings
    
    // MARK: Init
    
    init(defaultSettings: AppDefaultSettings) {
        defaults = defaultSettings
    }
    
}

// MARK: - AppSettingsService

extension AppSettingsService: AppSettingsServiceProtocol {
    
    // MARK: API
    
    var baseURL: String { defaults.baseURL }
    var successHttpStatusCodes: ClosedRange<Int> { defaults.successHttpStatusCodes }
    
    // MARK: Debug
    
    var isRequestLoggingEnabled: Bool { defaults.isRequestLoggingEnabled }
    var isResponseLoggingEnabled: Bool { defaults.isResponseLoggingEnabled }
    
}
