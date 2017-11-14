//
//  GalleryDetailDataViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let pictureChanged = Notification.Name("PictureChanged")
}

class GalleryDetailDataViewController: UIViewController {

    @IBOutlet weak var dataImage: UIImageView!

    var dataObject: URL?
    var photoIndex: Int = 0
    var animalType: AnimalType?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAnimalPhoto()
        NotificationCenter.default.post(name: .pictureChanged, object: nil, userInfo: ["index": photoIndex])
    }

    func getAnimalPhoto() {
        if let animalType = animalType {
            switch animalType {
            case .DOG:
                self.dataImage.image = #imageLiteral(resourceName: "placeholder_dog")
            case .CAT:
                self.dataImage.image = #imageLiteral(resourceName: "placeholder_cat")
            }
        } else {
            self.dataImage.image = #imageLiteral(resourceName: "placeholder")
        }
        if let dataObject = self.dataObject {
            DispatchQueue.main.async {
                PhotoManager.shared.getPhoto(from: dataObject, completion: { [weak self] (image) -> Void in
                    if let image = image {
                        self?.dataImage.image = image
                    }
                })
            }
        }
    }
}
