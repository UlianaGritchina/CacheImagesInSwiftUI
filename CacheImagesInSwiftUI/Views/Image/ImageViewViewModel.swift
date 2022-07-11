//
//  ImageViewViewModel.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

class ImageViewViewModel: ObservableObject {
    
    @Published var image: Image?
    @Published var networkState: NetworkState = .loading
    
    init() { fetchImage() }
    
    func fetchImage() {
        NetworkManager.shared.downloadImage(from: "https://picsum.photos/200") { image, networkState in
            DispatchQueue.main.async {
                if let image = image {
                    self.image = Image(uiImage: image)
                }
                self.networkState = networkState
            }
        }
    }
    
}