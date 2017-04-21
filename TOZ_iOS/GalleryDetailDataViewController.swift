//
//  GalleryDetailDataViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryDetailDataViewController: UIViewController {

    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var photoCaption: UILabel!

    var dataObject: URL?
    var photoIndex: Int = 0
    var photosCount: Int = 0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAnimalPhoto()
        self.photoCaption.text = "Zdjęcie \(photoIndex) / \(photosCount)"
    }

    func getAnimalPhoto() {
            if let dataObject = self.dataObject {
                DispatchQueue.main.async {
                    PhotoManager.shared.getPhoto(from: dataObject, completion: { [weak self] (image) -> (Void) in
                    self?.dataImage.image = image
                })
                }
            } else {
        self.dataImage.image = #imageLiteral(resourceName: "placeholder")
        }
    }
}
