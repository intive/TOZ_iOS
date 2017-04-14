//
//  GalleryDetailPhotoViewController.swift
//  TOZ_iOS
//
//  Created by Filip Zieliński on 11/04/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryDetailPhotoViewController: UIViewController {

    @IBOutlet weak var galleryDetailPhoto: UIImageView!

    var galleryDetailPhotoURL: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let galleryDetailPhotoURL = galleryDetailPhotoURL {
            PhotoManager.shared.getPhoto(from: galleryDetailPhotoURL, completion: {(image) -> (Void) in
                self.galleryDetailPhoto.image = image
            })
        }
    }
}
