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

    var cache: [URL : UIImage] = [:]

    func getPhoto(from url: URL, completion: ((UIImage?) -> ())) {
        let image: UIImage? = nil
        if let image = image {
            cache[url] = image
        }
        completion(image)
    }
}
