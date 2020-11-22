//
//  PhotoCell.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI
import class Kingfisher.ImageCache
import KingfisherSwiftUI

struct PhotoCell: View {
    
    let photo: Photo
    @State private var done = false

    var body: some View {
        HStack(alignment: .center) {
            KFImage(photo.smallImageURL, isLoaded: $done)
                .resizable()
                .placeholder {
                    Image(systemImageType: .placeholderImage)
                        .placeholderModifier()
                }
                .cancelOnDisappear(true)
                .aspectRatio(1, contentMode: .fit)
                .cornerRadius(.smallImageCornerRadius)
                .opacity(done || alreadyCached ? .smallImageLoadedOpacity : .smallImageLoadingOpacity)
                .animation(.linear(duration: .defaultLinearDuration))
        }
    }
    
}

// MARK: - Helpers

private extension PhotoCell {
    
    var alreadyCached: Bool {
        ImageCache.default.isCached(forKey: photo.smallImageURL.absoluteString)
    }
    
}

// MARK: - Preview

struct PhotoCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCell(photo: Photo(id: 1,
                               albumId: 1,
                               title: "title",
                               smallImageURL: URL(string: "https://via.placeholder.com/150/14ba42")!,
                               bigImageURL: URL(string: "https://via.placeholder.com/600/14ba42")!))
            .previewLayout(.fixed(width: 150, height: 150))
    }
}
