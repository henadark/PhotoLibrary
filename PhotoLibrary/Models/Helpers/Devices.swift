//
//  Devices.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

enum Devices: String, CaseIterable {
    
    case iPhone8 = "iPhone 8"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhoneSE = "iPhone SE"
    
    static var all: [String] { Devices.allCases.map { $0.rawValue } }
    
}
