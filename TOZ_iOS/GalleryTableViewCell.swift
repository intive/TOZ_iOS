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
    @IBOutlet weak var animalAge: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
