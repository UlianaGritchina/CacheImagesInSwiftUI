//
//  SettingsViewViewModel.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 16.07.2022.
//
import Foundation

enum AppType: String {
    case nsCache = "NSCache"
    case fileManager = "File Manager"
}

class SettingsViewViewModel: ObservableObject {
    
    @Published var type: AppType = UserDefaultsManager.instance.getAppType()
    
    func setType(_ type: AppType) {
        self.type = type
        UserDefaultsManager.instance.setAppTypeWith(type)
    }
    
}
