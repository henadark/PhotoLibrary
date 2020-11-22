//
//  ViewModifiers.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

struct IconImage: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.title)
    }
    
}

struct CircularProgressView: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(.progressViewScale)
    }
    
}
