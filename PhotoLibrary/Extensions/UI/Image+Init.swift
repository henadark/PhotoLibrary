//
//  Image+Init.swift
//  UserPhotos
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

extension Image {
    
    init(systemImageType: SystemImageType) {
        self.init(systemName: systemImageType.rawValue)
    }
    
}
