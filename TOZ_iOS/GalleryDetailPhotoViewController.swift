//
//  GalleryDetailPhotoViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryDetailPhotoViewController: UIViewController, UIPageViewControllerDelegate {

    var galleryDetailPhotoURL: URL?
    var photos: [URL] = []
    var pageViewController: UIPageViewController?

    lazy var modelController = GalleryDetailModelController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure the page view controller and add it as a child view controller.
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController!.delegate = self

        // For now if there is photoURL for the Animal than add it to array of photos.
        // To be changed when backend starts to return array of urls instead of just one url.
        if let myGalleryDetailPhotoURL = galleryDetailPhotoURL {
            self.photos.append(myGalleryDetailPhotoURL)
        } else {
            // change to a placeholder image provided by backend (todo)
            let placeholderURL = URL(string: "https://placeimg.com/640/480/animals/grayscale")
            if let placeholderURL = placeholderURL {
                self.photos.append(placeholderURL)
            }
        }

        self.modelController.pageData = photos

        let startingViewController: GalleryDetailDataViewController = self.modelController.viewController(at: 0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false)

        self.pageViewController!.dataSource = self.modelController

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)

        self.pageViewController!.didMove(toParentViewController: self)
    }
}
