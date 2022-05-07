//
//  CachedImageView.swift
//  RickAndMorty
//
//  Created by mac on 20.01.2022.
//

import UIKit

class CachedImageView: UIImageView {
    
    var imageCashe = NSCache<NSString, UIImage>()
    var imageURLString: String?
    
    func downloadImageFrom(urlString: String, imageMode: UIView.ContentMode) {
        guard let url = URL(string: urlString) else { return }
        downloadImageFrom(url: url, imageMode: imageMode)
    }
    
    func downloadImageFrom(url: URL, imageMode: UIView.ContentMode) {
        contentMode = imageMode
        if let cachedImage = imageCashe.object(forKey: url.absoluteString as NSString) {
            self.image = cachedImage
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                guard let imageData = UIImage(data: data) else { return }
                self.imageCashe.setObject(imageData, forKey: url.absoluteString as NSString)
                
                DispatchQueue.main.async {
                    self.image = imageData
                }
            } .resume()
        }
    }
    
}

