//
//  GalleryTableViewCell.swift
//  TOZ_iOS
//
//  Created by Kobsonauta on 27.03.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {
    @IBOutlet weak var animalImage: ProfilePhotoView!
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
        self.animalType.text = animal.type
        let imageUrl: URL? = animal.imageUrl
        animalImage.photo = nil
        if let imageUrl = imageUrl {
            PhotoManager.shared.getPhoto(from: imageUrl, completion: {(image) -> (Void) in
                if self.animalID == animal.animalID {
                    self.animalImage.photo = image
                }
            })
        }
    }
}
