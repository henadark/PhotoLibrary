//
//  PresentationFactory.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

final class PresentationFactory: ObservableObject {
    
    // MARK: Stored Properties
    
    private let viewModelBuilder: ViewModelBuilderProtocol
    private let viewBuilder: ViewBuilderProtocol
    
    // MARK: Init
    
    init(viewModelBuilder: ViewModelBuilderProtocol, viewBuilder: ViewBuilderProtocol) {
        self.viewModelBuilder = viewModelBuilder
        self.viewBuilder = viewBuilder
    }
    
}

// MARK: - Views

extension PresentationFactory {
    
    func rootView() -> some View {
        return viewBuilder.usersListView(with: viewModelBuilder.usersListViewModel).environmentObject(self)
    }
    
    func albumsListView(for userId: Int) -> some View {
        let viewModel = viewModelBuilder.albumsListViewModel(for: userId)
        return viewBuilder.albumsListView(with: viewModel).environmentObject(self)
    }
    
    func photosGridView(for userId: Int, albumId: Int) -> some View {
        let viewModel = viewModelBuilder.photosGridViewModel(for: userId, albumId: albumId)
        return viewBuilder.photosGridView(with: viewModel).environmentObject(self)
    }
    
    func photoView(withImage url: URL) -> PhotoView {
        let viewModel = viewModelBuilder.photoViewModel(withImage: url)
        return viewBuilder.photoView(with: viewModel)
    }
    
}

// MARK: - Class Functions

extension PresentationFactory {
    
    class func build() -> Self {
        let services = ServicesAssembly()
        let viewModelBuilder = ViewModelBuilder(services: services)
        let viewBuilder = ContentViewBuilder()
        return Self(viewModelBuilder: viewModelBuilder, viewBuilder: viewBuilder)
    }
    
}
