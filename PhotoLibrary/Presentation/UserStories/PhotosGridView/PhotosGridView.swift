//
//  PhotosGridView.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

struct PhotosGridView: View {
    
    private let adaptiveColumn = [GridItem(.adaptive(minimum: .minPhotoCellWidth), spacing: .gridSpacing)]
    @EnvironmentObject var presentationFactory: PresentationFactory
    @ObservedObject var viewModel: PhotosGridViewModel
    
    var body: some View {
        Group {
            if viewModel.dataSourceIsLoaded == true {
                photosGrid
            } else {
                progressView
            }
        }
        .navigationBarTitle(Text(viewModel.navigationTitle), displayMode: .inline)
        .onAppear(perform: viewModel.performOnAppear)
    }
    
}

// MARK: - Subviews

private extension PhotosGridView {
    
    var progressView: some View {
        ProgressView()
            .circularProgress()
    }
    
    var photosGrid: some View {
        ScrollView {
            LazyVGrid(columns: adaptiveColumn, spacing: .gridSpacing) {
                ForEach(viewModel.dataSource) { photo in
                    row(data: photo)
                }
            }
            .padding(.horizontal, .gridSpacing)
        }
    }
    
    func row(data: Photo) -> some View {
        return NavigationLink(
            destination: presentationFactory.photoView(withImage: data.bigImageURL).lazy,
            label: {
                PhotoCell(photo: data)
            })
    }
    
}

// MARK: - Preview

struct PhotosGridView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Devices.all, id: \.self) { device in
            PresentationFactory.build().photosGridView(for: 1, albumId: 1)
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
