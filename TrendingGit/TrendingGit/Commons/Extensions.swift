//
//  Extensions.swift
//  TrendingGit
//
//  Created by VenD-Samana on 22/10/2022.
//

import UIKit

class ImageStore: NSObject {
    static let imageCache = NSCache<NSString, UIImage>()
    
    static func getImage(_ urlString: String, completion: @escaping(_ url: String, _ img: UIImage?) -> Void) {
        DispatchQueue.global().async {
            guard let url = URL(string: urlString) else {
                return
            }

            let urlToString = url.absoluteString as NSString
            if let cachedImage = ImageStore.imageCache.object(forKey: urlToString) {
                completion(urlString, cachedImage)
            } else if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    
                ImageStore.imageCache.setObject(image, forKey: urlToString)
                completion(urlString, image)
            } else {
                completion(urlString, nil)
            }
        }
    }
}
