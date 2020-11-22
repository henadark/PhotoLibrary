//
//  AppSettingsServiceProtocol.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

protocol AppSettingsServiceProtocol {
    
    // MARK: - API
    
    var baseURL: String { get }
    var successHttpStatusCodes: ClosedRange<Int> { get }
    
    // MARK: - Debug
    
    var isRequestLoggingEnabled: Bool { get }
    var isResponseLoggingEnabled: Bool { get }
    
    
}
