//
//  ViewModelBuilderProtocol.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

protocol ViewModelBuilderProtocol {
    
    var usersListViewModel: UsersListViewModel { get }
    func albumsListViewModel(for userId: Int) -> AlbumsListViewModel
    func photosGridViewModel(for userId: Int, albumId: Int) -> PhotosGridViewModel
    func photoViewModel(withImage url: URL) -> PhotoViewModel
    
}
