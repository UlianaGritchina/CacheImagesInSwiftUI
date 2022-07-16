//
//  ImageViewViewModel.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

class MainViewViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var appTapy: AppTapy = UserDefaultsManager.instanse.getAppTapy()
    @Published var networkState: NetworkState = .loading
    @Published var isShowingSavedMassage = false
    @Published var title = ""
    @Published var isShowingSettingsView = false
    
    init() {
        title = appTapy.rawValue
        fetchImage()
    }
    
    func fetchImage() {
        NetworkManager.shared.downloadImage(from: "https://picsum.photos/200") { image, networkState in
            DispatchQueue.main.async {
                if let image = image {
                    self.image = image
                }
                self.networkState = networkState
            }
        }
    }
    
    func dowloadNewImage() {
        fetchImage()
    }
    
    func showSettingsView() {
        isShowingSettingsView.toggle()
    }
    
    private func showSaveMassage() {
        isShowingSavedMassage = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isShowingSavedMassage = false
        }
    }
    
    func saveImage() {
        switch appTapy {
        case .nsCache: saveToCache()
        case .fileManager: saveToFileManager()
        }
        showSaveMassage()
    }
    
    private func saveToCache() {
        guard let image = image else { return }
        CahceManager.instance.add(image: image, name: "saved")
    }
    
    private func saveToFileManager() {
        guard let image = image else { return }
        PhotoFileManager.instanse.add(key: "saved", image: image)
        
    }
    
}
