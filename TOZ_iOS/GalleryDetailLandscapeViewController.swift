//
//  GalleryDetailLandscapeViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryDetailLandscapeViewController: UIViewController {
    @IBOutlet weak var photosContainer: UIView!
    @IBOutlet weak var pictureCaption: UILabel!

    var galleryDetailViewController: GalleryDetailViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
       galleryDetailViewController = storyboard?.instantiateViewController(withIdentifier: "GalleryDetailViewController") as? GalleryDetailViewController
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.lockOrientationAndRotate(orientation: .portrait, andRotateTo: .portrait)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if (UIDevice.current.orientation.isLandscape) == false {
            self.lockOrientationAndRotate(orientation: .portrait, andRotateTo: .portrait)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
