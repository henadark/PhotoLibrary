//
//  View+Helpers.swift
//  UserPhotos
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

private struct LazyView<Content: View>: View {
    
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
    
}

// MARK: - Lazy Init

extension View {
    var lazy: some View {
        LazyView(self)
    }
}

// MARK: - Modifiers

extension View {
    
    // MARK: Icons
    
    func iconImage() -> some View {
        self.modifier(IconImage())
    }
    
    // MARK: Progress
    
    func circularProgress() -> some View {
        self.modifier(CircularProgressView())
    }
    
}
