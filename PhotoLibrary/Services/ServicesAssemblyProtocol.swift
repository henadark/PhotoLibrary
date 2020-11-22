//
//  ServicesAssemblyProtocol.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

protocol ServicesAssemblyProtocol {
    
    var settingsService: AppSettingsServiceProtocol { get }
    var apiService: APIServiceProtocol { get }
    var photoLibraryService: PhotoLibraryServiceProtocol { get }
    
}
