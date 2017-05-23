//
//  GalleryDetailPhotoViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryDetailPhotoViewController: UIViewController, UIPageViewControllerDelegate {

    var pageViewController: UIPageViewController?
    lazy var modelController = GalleryDetailModelController()

    var photos: [URL] = [] {
        didSet {
            // Configure the page view controller and add it as a child view controller.
            self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            self.pageViewController!.delegate = self

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
    var animalType: String? {
        didSet {
            self.modelController.animalType = animalType
        }
    }
}
