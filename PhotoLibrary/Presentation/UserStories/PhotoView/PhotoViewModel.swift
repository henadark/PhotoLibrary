//
//  PhotoViewModel.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

final class PhotoViewModel: ObservableObject {
    
    // MARK: Stored Properties
    
    let imageURL: URL
    
    // MARK: Init
    
    init(withImage url: URL) {
        imageURL = url
    }
    
}
