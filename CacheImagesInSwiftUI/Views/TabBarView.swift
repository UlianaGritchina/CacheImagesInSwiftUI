//
//  TabBarView.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ImageView()
                .tabItem {
                    Label("Image", systemImage: "photo")
                }
            
            SavedImageView()
                .tabItem {
                    Label("Saved", systemImage: "photo.fill.on.rectangle.fill")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
