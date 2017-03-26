//
//  GalleryViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class GalleryViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    //@IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        PhotoManager.shared.getPhoto(from: "https://static.pexels.com/photos/347721/pexels-photo-347721.jpeg", completion: {(image) -> (Void) in
            if let image = image {
                self.imageView.image = image
            }
        })
    }

}
