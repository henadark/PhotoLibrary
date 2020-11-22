//
//  UserDataCell.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

struct UserDataCell: Equatable {
    
    let name: String
    let imageType: SystemImageType
    
}

// MARK: - Identifiable

extension UserDataCell: Identifiable {
    
    var id: String { UUID().uuidString }
    
}

func ==(lhs: UserDataCell, rhs: UserDataCell) -> Bool {
    return lhs.id == rhs.id
}
