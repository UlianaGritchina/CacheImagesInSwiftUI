//
//  SavedViewViewModel.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 16.07.2022.
//

import SwiftUI

class SavedViewViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isShowigMessages = false
    
    func fetchImage() {
        image = CahceManager.instance.get(name: "saved")
    }
    
    func delete() {
        isShowigMessages = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isShowigMessages = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            CahceManager.instance.remove(name: "saved")
            self.image = CahceManager.instance.get(name: "saved")
        }
    }
    
}
