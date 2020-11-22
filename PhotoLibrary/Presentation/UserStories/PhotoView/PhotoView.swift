//
//  PhotoView.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI
import KingfisherSwiftUI

struct PhotoView: View {
    
    @ObservedObject var viewModel: PhotoViewModel
    
    var body: some View {
        VStack {
            KFImage(viewModel.imageURL)
                .placeholder {
                    progressView
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(.bigImageCornerRadius)
                .shadow(radius: .bigImageShadowRadius)
            
        }
        .padding(.horizontal)
    }
}

// MARK: - Subviews

private extension PhotoView {
    
    var progressView: some View {
        ProgressView()
            .circularProgress()
    }
    
}

// MARK: - Preview

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Devices.all, id: \.self) { device in
            PresentationFactory.build().photoView(withImage: URL(string: "https://via.placeholder.com/600/14ba42")!)
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
