//
//  GalleryDetailPhotoViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class GalleryDetailPhotoViewController: UIViewController, UIPageViewControllerDelegate {

    var galleryDetailPhotoURL: URL?
    var photos: [UIImage] = []
    var pageViewController: UIPageViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure the page view controller and add it as a child view controller.
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController!.delegate = self

        // For now add photo of the Animal to array of photos.
        // To be changed when backend starts to return array of urls instead of just one url.
        if let galleryDetailPhotoURL = galleryDetailPhotoURL {
            PhotoManager.shared.getPhoto(from: galleryDetailPhotoURL, completion: {(image) -> (Void) in
                if let image = image {
                    self.photos.append(image)
                }
            })
        }

        // Use placeholder image when Animal does not have photo.
        if photos.count > 0 {
            self.modelController.pageData = photos
        } else {
        // Currently pageData contains more images than one placeholder just to show how swiping through images work.
            self.modelController.pageData = [#imageLiteral(resourceName: "placeholder"), #imageLiteral(resourceName: "dog1"), #imageLiteral(resourceName: "dog2"), #imageLiteral(resourceName: "dog3")]
        }

        let startingViewController: GalleryDetailDataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false)

        self.pageViewController!.dataSource = self.modelController

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)

        self.pageViewController!.didMove(toParentViewController: self)
    }

    var modelController: GalleryDetailModelController {
        // Return the model controller object, creating it if necessary.
        if initialModelController == nil {
            initialModelController = GalleryDetailModelController()
        }
        return initialModelController!
    }

    var initialModelController: GalleryDetailModelController?
}
