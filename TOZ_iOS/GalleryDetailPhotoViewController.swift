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

        if let galleryDetailPhotoURL = galleryDetailPhotoURL {
            PhotoManager.shared.getPhoto(from: galleryDetailPhotoURL, completion: {(image) -> (Void) in
                if let image = image {
                    self.photos.append(image)
                }
            })
        }

        if photos.count != 0 {
            self.modelController.pageData = photos
        } else {
            self.modelController.pageData = [#imageLiteral(resourceName: "placeholder")]
        }

        let startingViewController: GalleryDetailDataViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        // swiftlint:disable unused_closure_parameter
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })

        self.pageViewController!.dataSource = self.modelController

        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)

        self.pageViewController!.didMove(toParentViewController: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var modelController: GalleryDetailModelController {
        // Return the model controller object, creating it if necessary.
        if initialModelController == nil {
            initialModelController = GalleryDetailModelController()
        }
        return initialModelController!
    }

    // swiftlint:disable redundant_optional_initialization
    var initialModelController: GalleryDetailModelController? = nil

    // MARK: - UIPageViewController delegate methods

    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .portrait) || (orientation == .portraitUpsideDown) || (UIDevice.current.userInterfaceIdiom == .phone) {
            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to true, so set it to false here.
            let currentViewController = self.pageViewController!.viewControllers![0]
            let viewControllers = [currentViewController]
            // swiftlint:disable unused_closure_parameter
            self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })

            self.pageViewController!.isDoubleSided = false
            return .min
        }

        // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
        // swiftlint:disable force_cast
        let currentViewController = self.pageViewController!.viewControllers![0] as! GalleryDetailDataViewController
        var viewControllers: [UIViewController]

        let indexOfCurrentViewController = self.modelController.indexOfViewController(currentViewController)
        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
            let nextViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerAfter: currentViewController)
            viewControllers = [currentViewController, nextViewController!]
        } else {
            let previousViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerBefore: currentViewController)
            viewControllers = [previousViewController!, currentViewController]
        }
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })

        return .mid
    }

    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        if let galleryDetailPhotoURL = galleryDetailPhotoURL {
    //            PhotoManager.shared.getPhoto(from: galleryDetailPhotoURL, completion: {(image) -> (Void) in
    //                self.galleryDetailPhoto.image = image
    //            })
    //        }
    //    }
}
