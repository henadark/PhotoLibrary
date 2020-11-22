//
//  User.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

final class User: Codable {
    
    let id: Int
    let name: String
    var photoAlbumbs: [PhotoAlbum]?
    
}
