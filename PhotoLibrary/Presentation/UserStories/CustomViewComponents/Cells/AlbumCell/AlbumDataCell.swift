//
//  AlbumDataCell.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

struct AlbumDataCell: Equatable, Identifiable {
    
    let id: Int
    let userId: Int
    let name: String
    let imageType: SystemImageType
    
}

func ==(lhs: AlbumDataCell, rhs: AlbumDataCell) -> Bool {
    return lhs.id == rhs.id
}
