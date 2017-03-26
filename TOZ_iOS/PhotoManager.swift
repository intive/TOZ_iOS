//
//  PhotoManager.swift
//  TOZ_iOS
//
//  Created by Piotr Tobolski on 15.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation
import UIKit

class PhotoManager {

    static let shared = PhotoManager()
    private init() {}

    private var cache = [String: UIImage]()
    func getPhoto(from url: String, completion: @escaping ((UIImage?) -> Void)) {
        var image: UIImage? = nil
        if let image = self.cache[url] {
            completion(image)
        } else {
            URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, _, _) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if let data = data {
                        image = UIImage(data: data)
                        self.cache[url] = image
                        completion(image)
                    } else {
                        completion(nil)
                    }
                })
            }).resume()
        }
    }
}
