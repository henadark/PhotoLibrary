//
//  AlbumCell.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

struct AlbumCell: View {
    
    let data: AlbumDataCell
    
    var body: some View {
        HStack {
            Image(systemImageType: data.imageType)
                .iconImage()
            Text(data.name)
            Spacer()
        }
        .padding(.vertical)
    }
    
}

struct AlbumCell_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCell(data: .init(id: 1, userId: 1, name: "1", imageType: .folder))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
