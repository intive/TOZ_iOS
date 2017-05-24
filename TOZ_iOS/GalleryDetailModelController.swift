//
//  GalleryDetailModelController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

/*
 The controller serves as the data source for the page view controller
 */

class GalleryDetailModelController: NSObject, UIPageViewControllerDataSource {

    var pageData: [URL] = []
    var animalType: String?

    func viewController(at index: Int, storyboard: UIStoryboard) -> GalleryDetailDataViewController? {
        guard (self.pageData.count > 0) || (index <= self.pageData.count) else {
            return nil
        }

        // Create a new view controller and pass suitable data.
        guard let dataViewController = storyboard.instantiateViewController(withIdentifier: "GalleryDetailDataViewController") as? GalleryDetailDataViewController else { return nil }
        if self.pageData.isEmpty {
            //if there was no photo provided than GalleryDetailDataViewController
            //will handle the url to nothing and display placeholder photo
            self.pageData = [URL(string: "url")!]
        }
        dataViewController.dataObject = self.pageData[index]
        dataViewController.photoIndex = index + 1
        dataViewController.animalType = self.animalType
        return dataViewController
    }

    // Return the index of the given data view controller.
    func index(of viewController: GalleryDetailDataViewController) -> Int {
        return pageData.index(of: viewController.dataObject!) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard (viewController as? GalleryDetailDataViewController) != nil else { return nil }
        var index = self.index(of: (viewController as? GalleryDetailDataViewController)!)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }

        index -= 1
        return self.viewController(at: index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard (viewController as? GalleryDetailDataViewController) != nil else { return nil }
        var index = self.index(of: (viewController as? GalleryDetailDataViewController)!)
        if index == NSNotFound {
            return nil
        }

        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewController(at: index, storyboard: viewController.storyboard!)
    }
}
