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

    var pageData: [UIImage] = []

    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> GalleryDetailDataViewController? {
        // Return the data view controller for the given index.
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }

        // Create a new view controller and pass suitable data.
        guard let dataViewController = storyboard.instantiateViewController(withIdentifier: "GalleryDetailDataViewController") as? GalleryDetailDataViewController else { return nil }
        dataViewController.dataObject = self.pageData[index]
        dataViewController.photoIndex = index + 1
        dataViewController.photosCount = self.pageData.count
        return dataViewController
    }

    // Return the index of the given data view controller.
    func indexOfViewController(_ viewController: GalleryDetailDataViewController) -> Int {
        return pageData.index(of: viewController.dataObject) ?? NSNotFound
    }

    // MARK: - Page View Controller Data Source

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard (viewController as? GalleryDetailDataViewController) != nil else { return nil }
        var index = self.indexOfViewController((viewController as? GalleryDetailDataViewController)!)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }

        index -= 1
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard (viewController as? GalleryDetailDataViewController) != nil else { return nil }
        var index = self.indexOfViewController((viewController as? GalleryDetailDataViewController)!)
        if index == NSNotFound {
            return nil
        }

        index += 1
        if index == self.pageData.count {
            return nil
        }
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}
