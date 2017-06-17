//
//  GalleryTableViewCell.swift
//  TOZ_iOS
//
//  Created by Kobsonauta on 27.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalType: UILabel!

    private var animalID: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Color.Cell.Background.secondary
        animalName.adjustsFontSizeToFitWidth = true
    }

    func configure(for animal: AnimalItem) {
        animalID = animal.animalID
        self.animalName.text = animal.name
        self.animalType.text = animal.type.localizedType

        let imageUrl: URL? = animal.imageUrl
        animalImage.contentMode = .scaleAspectFill
        animalImage.clipsToBounds = true
        switch animal.type {
            case .CAT:
                self.animalImage.image = #imageLiteral(resourceName: "placeholder_cat")
            case .DOG:
                self.animalImage.image = #imageLiteral(resourceName: "placeholder_dog")
        }
        if let imageUrl = imageUrl {
            PhotoManager.shared.getPhoto(from: imageUrl, completion: {(image) -> (Void) in
                if self.animalID == animal.animalID {
                    if let image = image {
                        self.animalImage.image = image
                    }
                }
            })
        }
    }
}
