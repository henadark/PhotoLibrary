//
//  ContentViewBuilder.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

final class ContentViewBuilder {
    
}

// MARK: - ViewBuilderProtocol

extension ContentViewBuilder: ViewBuilderProtocol {
    
    func usersListView(with viewModel: UsersListViewModel) -> UsersListView {
        return UsersListView(viewModel: viewModel)
    }
    
    func albumsListView(with viewModel: AlbumsListViewModel) -> AlbumsListView {
        return AlbumsListView(viewModel: viewModel)
    }
    
    func photosGridView(with viewModel: PhotosGridViewModel) -> PhotosGridView {
        return PhotosGridView(viewModel: viewModel)
    }
    
    func photoView(with viewModel: PhotoViewModel) -> PhotoView {
        PhotoView(viewModel: viewModel)
    }
    
}
