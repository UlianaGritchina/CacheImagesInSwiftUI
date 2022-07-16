//
//  SettingsViewViewModel.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 16.07.2022.
//
import Foundation

enum AppTapy: String {
    case nsCache = "NSCache"
    case fileManager = "File Manager"
}

class SettngsViewViewModel: ObservableObject {
    
    @Published var tapy: AppTapy = UserDefaultsManager.instanse.getAppTapy()
    
    func chouse(_ tapy: AppTapy) {
        self.tapy = tapy
    }
    
    func setTapy() {
        chouse(tapy)
        UserDefaultsManager.instanse.setAppTapyWith(tapy)
    }
    
}
