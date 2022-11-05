//
//  ImageCacheManager.swift
//  SquareTHP
//
//  Created by Andres Gutierrez on 11/5/22.
//

import UIKit

class ImageCacheManager {
    
    static let instance = ImageCacheManager()
    
    private init () {}
    
    var cache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        cache.setObject(image, forKey: name as NSString)
    }
    
    func get(name: String) -> UIImage? {
        cache.object(forKey: name as NSString)
    }
}
