//
//  UIImageView+Remote.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

extension UIImageView {
    enum Key {
        static var image = "com.byziad.image.key"
    }

    private var currentTask: URLSessionDataTask? {
        get {
            return objc_getAssociatedObject(self, &Key.image) as? URLSessionDataTask
        }
        set {
            objc_setAssociatedObject(self, &Key.image, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func setImage(from url: URL?, placeholder: UIImage? = nil) {
        currentTask?.cancel()

        if let url = url {
            if let cachedImage = ImageCache.shared.image(for: url) {
                image = cachedImage
            } else {
                image = placeholder
            }

            currentTask = URLSession.shared.dataTask(with: url, completionHandler: {
                data, response, error in

                if let data = data, let image = UIImage(data: data) {
                    ImageCache.shared.set(image, for: url)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            })

            currentTask?.resume()

        } else {
            image = placeholder
            currentTask = nil
        }
    }
}

private class ImageCache: NSCache<NSString, UIImage> {
    static let shared = ImageCache()

    func set(_ image: UIImage, for url: URL) {
        setObject(image, forKey: url.absoluteString as NSString)
    }

    func image(for url: URL?) -> UIImage? {
        guard let url = url else { return nil }
        return object(forKey: url.absoluteString as NSString)
    }
}
