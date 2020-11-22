//
//  AppDefaultSettings.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

struct AppDefaultSettings {
    
    // MARK: - API
    
    let baseURL: String = "https://jsonplaceholder.typicode.com/"
    let successHttpStatusCodes = 200...299
    
    // MARK: - Debug
    
    let isRequestLoggingEnabled = true
    let isResponseLoggingEnabled = true
    
}
