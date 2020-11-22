//
//  ViewBuilderProtocol.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

protocol ViewBuilderProtocol {
    
    func usersListView(with viewModel: UsersListViewModel) -> UsersListView
    func albumsListView(with viewModel: AlbumsListViewModel) -> AlbumsListView
    func photosGridView(with viewModel: PhotosGridViewModel) -> PhotosGridView
    func photoView(with viewModel: PhotoViewModel) -> PhotoView
    
}
