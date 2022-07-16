//
//  CacheManager.swift
//  CacheImagesInSwiftUI
//
//  Created by Ульяна Гритчина on 12.07.2022.
//

import UIKit

class CahceManager {
    
    static let instance = CahceManager()
    private init() { }
    
    var imageCahce: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCahce.setObject(image, forKey: name as NSString)
    }
    
    func remove(name: String) {
        imageCahce.removeObject(forKey: name as NSString)
    }
    
    func get(name: String) -> UIImage? {
        imageCahce.object(forKey: name as NSString)
    }
    
}
