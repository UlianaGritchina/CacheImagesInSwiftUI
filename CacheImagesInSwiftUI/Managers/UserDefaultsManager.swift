//
//  UserDefaultsManager.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 16.07.2022.
//

import Foundation

class UserDefaultsManager {
    
    static let instanse = UserDefaultsManager()
    private init() { }
    
    func setAppTapyWith(_ tapy: AppTapy) {
        switch tapy {
        case .nsCache:
            UserDefaults.standard.set(0, forKey: "appTapy")
        case .fileManager:
            UserDefaults.standard.set(1, forKey: "appTapy")
        }
    }
    
    func getAppTapy() -> AppTapy {
        let tapyNumber = UserDefaults.standard.integer(forKey: "appTapy")
        if tapyNumber == 1 {
            return .fileManager
        } else {
            return .nsCache
        }
    }
    
}
