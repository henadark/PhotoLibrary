//
//  Photo.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

struct Photo: Codable, Identifiable {
    
    // MARK: Stored Properties
    
    let id: Int
    let albumId: Int
    let title: String
    let smallImageURL: URL
    let bigImageURL: URL
    
    // MARK: Codable Protocol
    
    private enum CodingKeys: String, CodingKey {
        case id, albumId, title
        case smallImageURL = "thumbnailUrl"
        case bigImageURL = "url"
    }
    
}
