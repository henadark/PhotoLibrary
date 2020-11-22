//
//  PhotoAlbum.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

final class PhotoAlbum: Codable {
    
    let id: Int
    let userId: Int
    let title: String
    var photos: [Photo]?
    
}
