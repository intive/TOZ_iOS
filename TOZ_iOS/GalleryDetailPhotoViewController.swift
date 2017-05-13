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

        if photos.isEmpty {
//            let placeholderPath: String = (Bundle.main.url(forResource: "pug_logo", withExtension: "png")?.path)!
            let placeholderURL = URL(string: "https://placeimg.com/640/480/animals/grayscale")
            if let placeholderURL = placeholderURL {
                self.modelController.pageData = [placeholderURL]
            }
        } else {
            self.modelController.pageData = photos
        }

        let startingViewController: GalleryDetailDataViewController = self.modelController.viewController(at: 0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false)

        self.pageViewController!.dataSource = self.modelController

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)

        self.pageViewController!.didMove(toParentViewController: self)
    }
}
