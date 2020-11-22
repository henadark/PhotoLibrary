//
//  Image+Modifiers.swift
//  UserPhotos
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

extension Image {
    
    func placeholderModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.gray)
            .padding()
   }
    
}
