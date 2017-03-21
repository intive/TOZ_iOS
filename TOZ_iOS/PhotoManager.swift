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

    private var cache: [String : UIImage] = [:] // previously [URL : UIImage]
    func getPhoto(from url: String/*, completion: ((UIImage?) -> Void)*/) {
        var image: UIImage? = nil
        if cache[url] == nil {
            print("1")
            //cache[url] = image
            URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, _, _) -> Void in // previously (data, response, error)
                DispatchQueue.main.async(execute: { () -> Void in
                    let img = UIImage(data: data!)
                    image = img!
                    self.cache[url] = image
                })
            }).resume()
        } else if self.cache[url] != nil {
            print("2")
            image = self.cache[url]
        } else {
            print("Error")
        }
        //completion(image)
    }
}


// wywolanie w ViewDidLoad() klasy Gallery View Controller:
// PhotoManager.shared.getPhoto(from: "https://static.pexels.com/photos/347721/pexels-photo-347721.jpeg")
