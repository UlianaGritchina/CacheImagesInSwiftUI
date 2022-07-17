//
//  ImageViewViewModel.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 11.07.2022.
//

import SwiftUI

class MainViewViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var appType: AppType = UserDefaultsManager.instance.getAppType()
    @Published var networkState: NetworkState = .loading
    @Published var isShowingSavedMassage = false
    @Published var title = ""
    
    init() {
        setTitle()
        fetchImage()
    }
    
    func setTitle() {
        title = appType.rawValue
    }
    
    func setAppType() {
        appType = UserDefaultsManager.instance.getAppType()
    }
    
    func setupView() {
        setAppType()
        setTitle()
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
    
    func downloadNewImage() {
        fetchImage()
    }
    
    private func showSaveMassage() {
        isShowingSavedMassage = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isShowingSavedMassage = false
        }
    }
    
    func saveImage() {
        switch appType {
        case .nsCache: saveToCache()
        case .fileManager: saveToFileManager()
        }
        showSaveMassage()
    }
    
    private func saveToCache() {
        guard let image = image else { return }
        CacheManager.instance.add(image: image, name: "saved")
    }
    
    private func saveToFileManager() {
        guard let image = image else { return }
        PhotoFileManager.instance.add(key: "saved", image: image)
        
    }
    
}
