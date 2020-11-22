//
//  AlbumsListView.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

struct AlbumsListView: View {
    
    @EnvironmentObject var presentationFactory: PresentationFactory
    @ObservedObject var viewModel: AlbumsListViewModel
    
    var body: some View {
        Group {
            if viewModel.dataSourceIsLoaded {
                usersList
            } else {
                progressView
            }
        }
        .navigationBarTitle(Text(viewModel.navigationTitle), displayMode: .inline)
        .onAppear(perform: viewModel.performOnAppear)
    }
    
}

// MARK: - Subviews

private extension AlbumsListView {
    
    var progressView: some View {
        ProgressView()
            .circularProgress()
    }
    
    var usersList: some View {
        List(viewModel.dataSource, rowContent: row(data:))
    }
    
    func row(data: AlbumDataCell) -> some View {
        return NavigationLink(
            destination: presentationFactory.photosGridView(for: data.userId, albumId: data.id).lazy,
            label: {
                AlbumCell(data: data)
            })
    }
    
}

// MARK: - Preview

struct AlbumsListView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Devices.all, id: \.self) { device in
            PresentationFactory.build().albumsListView(for: 1)
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
