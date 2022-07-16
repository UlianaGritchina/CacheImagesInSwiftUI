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
    
    func fetchImageFrom(_ tapy: AppTapy) {
        switch tapy {
        case .nsCache: image = CahceManager.instance.get(name: "saved")
        case .fileManager: image = PhotoFileManager.instanse.get(key: "saved")
        }
    }
    
    func deleteImageFrom(_ tapy: AppTapy) {
        switch tapy {
        case .nsCache: deleteFromCache()
        case .fileManager: deleteFromFileManager()
        }
    }
    
    private func deleteFromCache() {
        isShowigMessages = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isShowigMessages = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            CahceManager.instance.remove(name: "saved")
            self.image = CahceManager.instance.get(name: "saved")
        }
    }
    
    private func deleteFromFileManager() {
        PhotoFileManager.instanse.delete(key: "saved")
        image = nil
    }
    
}
