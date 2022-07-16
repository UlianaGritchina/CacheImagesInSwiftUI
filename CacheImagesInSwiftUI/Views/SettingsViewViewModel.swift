//
//  SettingsViewViewModel.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 16.07.2022.
//
import Foundation

enum AppTapy {
    case nsCache
    case fileManager
}

class SettngsViewViewModel: ObservableObject {
    
    @Published var tapy: AppTapy = .nsCache
    
    func choseNSCache() {
        tapy = .nsCache
    }
    
    func choseFileManager() {
        tapy = .fileManager
    }
    
}
