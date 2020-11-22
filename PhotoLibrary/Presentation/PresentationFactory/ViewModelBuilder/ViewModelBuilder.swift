//
//  ViewModelBuilder.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation

final class ViewModelBuilder {
    
    // MARK: Stored Properties
    
    private let services: ServicesAssemblyProtocol
    
    // MARK: Init
    
    init(services: ServicesAssemblyProtocol) {
        self.services = services
    }
    
}

// MARK: - ViewModelBuilderProtocol

extension ViewModelBuilder: ViewModelBuilderProtocol {
    
    var usersListViewModel: UsersListViewModel {
        UsersListViewModel(photoLibraryService: services.photoLibraryService)
    }
    
    func albumsListViewModel(for userId: Int) -> AlbumsListViewModel {
        return AlbumsListViewModel(photoLibraryService: services.photoLibraryService, userId: userId)
    }
    
    
    func photosGridViewModel(for userId: Int, albumId: Int) -> PhotosGridViewModel {
        PhotosGridViewModel(photoLibraryService: services.photoLibraryService, userId: userId, albumId: albumId)
    }
    
    func photoViewModel(withImage url: URL) -> PhotoViewModel {
        PhotoViewModel(withImage: url)
    }
    
}
