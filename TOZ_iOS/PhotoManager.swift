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

    func getPhoto(from url: String, completion: @escaping ((UIImage?) -> Void)) {
        let imageData = UserDefaults.standard.object(forKey: url)
        if let imageData = imageData {
            let image = UIImage(data: (imageData as? Data)!)
            if let image = image {
                completion(image)
            } else {
                completion(nil)
            }
        } else {
            URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, _, _) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if let data = data {
                        let image = UIImage(data: data)
                        UserDefaults.standard.set(UIImagePNGRepresentation(image!), forKey: url)
                        completion(image)
                    } else {
                        completion(nil)
                    }
                })
            }).resume()
        }
    }
}
