//
//  UsersListViewModel.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import Foundation
import Combine

final class UsersListViewModel: ObservableObject {
    
    // MARK: Stored Properties
    
    private let photoLibraryService: PhotoLibraryServiceProtocol
    private var cancellableSet: Set<AnyCancellable> = []
    @Published var users = [User]()
    @Published var dataSource = [UserDataCell]()
    let navigationTitle = "Users"
    
    // MARK: Init
    
    init(photoLibraryService: PhotoLibraryServiceProtocol) {
        self.photoLibraryService = photoLibraryService
        fetchUsers()
    }
    
    deinit {
        cancellableSet.forEach { $0.cancel() }
    }
    
}

// MARK: - View Model

extension UsersListViewModel {
    
    var dataSourceIsLoaded: Bool { !dataSource.isEmpty }
    
    func userId(for userDataCell: UserDataCell) -> Int {
        let index = dataSource.firstIndex(of: userDataCell) ?? 0
        return photoLibraryService.users[index].id
    }
    
}

// MARK: - Helpers

private extension UsersListViewModel {
    
    func fetchUsers() {
        if photoLibraryService.users.isEmpty {
            updateUsers()
        } else {
            fetchUserDataCell(photoLibraryService.users)
        }
    }
    
    func updateUsers() {
        photoLibraryService.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] (completion) in
                guard case let .failure(error) = completion else { return }
                self?.handleRequest(error: error)
            } receiveValue: { [weak self] (newUsers) in
                self?.fetchUserDataCell(newUsers)
            }
            .store(in: &cancellableSet)
    }
    
    func fetchUserDataCell(_ users: [User]) {
        dataSource = users.map { UserDataCell(name: $0.name, imageType: .user) }
    }
    
    func handleRequest(error: Error) {
        guard let applicationError = error.applicationError else {
            print(error.localizedDescription)
            return
        }
        print(applicationError.localizedDescription)
    }
    
}
