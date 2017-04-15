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

    var dataObject: UIImage = #imageLiteral(resourceName: "placeholder")
    var photoIndex: Int = 0
    var photosCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dataImage!.image = dataObject
        self.photoCaption.text = "Zdjęcie \(photoIndex) / \(photosCount)"
    }
}
