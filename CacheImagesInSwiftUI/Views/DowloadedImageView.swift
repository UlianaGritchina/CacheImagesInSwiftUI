//
//  DowloadedImageView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct DowloadedImageView: View {
    let image: Image?
    var body: some View {
        if let image = image {
            image
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
        }
    }
}

struct DowloadedImageView_Previews: PreviewProvider {
    static var previews: some View {
        DowloadedImageView(image: Image(systemName: "heart"))
    }
}
