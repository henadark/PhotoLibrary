//
//  UserCell.swift
//  PhotoLibrary
//
//  Created by Hena Knyzhnyk on 22.11.2020.
//

import SwiftUI

struct UserCell: View {
    
    let data: UserDataCell
    
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

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(data: .init(name: "John", imageType: .user))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
