//
//  CalendarPageViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class CalendarPageViewController: UIPageViewController {

    var weekPages = [WeekViewController]()
    var indexPage: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self

        let weekAfter: WeekViewController = (self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as? WeekViewController)!
        guard let weekBefore: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as? WeekViewController else { return }

        weekBefore.view.backgroundColor = UIColor.darkGray
        weekAfter.view.backgroundColor = UIColor.orange
        weekPages.append(weekBefore)
        weekPages.append(weekAfter)
        //set initial view
        setViewControllers([weekBefore], direction: .forward, animated: true, completion: nil)

    }

    func getNextIndex() -> Int {
        indexPage += 1
        if indexPage > weekPages.count - 1 {
            indexPage = 0
        }

        return indexPage
    }

    func getPreviousIndex() -> Int {
        indexPage -= 1
        if indexPage < 0 {
            indexPage = weekPages.count - 1
        }

        return indexPage
    }

}

extension CalendarPageViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        return nil
    }

}
