//
//  UsersListView.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

struct UsersListView: View {
    
    @EnvironmentObject var presentationFactory: PresentationFactory
    @ObservedObject var viewModel: UsersListViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.dataSourceIsLoaded {
                    usersList
                } else {
                    progressView
                }
            }
            .navigationBarTitle(viewModel.navigationTitle)
        }
    }
    
}

// MARK: - Subviews

private extension UsersListView {
    
    var progressView: some View {
        ProgressView()
            .circularProgress()
    }
    
    var usersList: some View {
        List(viewModel.dataSource, rowContent: row(data:))
    }
    
    func row(data: UserDataCell) -> some View {
        NavigationLink(
            destination: presentationFactory.albumsListView(for: viewModel.userId(for: data)).lazy,
            label: {
                UserCell(data: data)
            })
    }
    
}

// MARK: - Preview

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Devices.all, id: \.self) { device in
            PresentationFactory.build().rootView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
