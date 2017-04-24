//
//  CalendarViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class CalendarViewController: UIViewController {

    @IBOutlet weak var prevButton: UIButton!

    @IBOutlet weak var nextButton: UIButton!

    @IBOutlet weak var currentDateLabel: UILabel!

    var pageController: UIPageViewController!
    var weekPages = [WeekViewController]()
    private var indexPage = 0

    @IBAction func nextWeek(_ sender: Any) {
       pageController.setViewControllers([nextWeekController()], direction: .forward, animated: true)
    }

    @IBAction func previousWeek(_ sender: Any) {
        pageController.setViewControllers([nextWeekController()], direction: .reverse, animated: true)
    }

    func nextWeekController() -> WeekViewController {
        indexPage -= 1
        indexPage = abs(indexPage)

        return weekPages[indexPage]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // swiftlint:disable:next force_cast
        //pageController = self.childViewControllers.first as! UIPageViewController
        pageController.dataSource = self
        // swiftlint:disable:next force_cast
        let weekAfter: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as! WeekViewController
        // swiftlint:disable:next force_cast
        let weekBefore: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as! WeekViewController

        weekPages.append(weekBefore)
        weekPages.append(weekAfter)
        //set initial view
        pageController.setViewControllers([weekBefore], direction: .forward, animated: true)
    }

    override func viewDidLayoutSubviews() {
        prevButton.layer.cornerRadius = prevButton.bounds.height * 0.5
        prevButton.setTitleColor(UIColor.darkGray, for: .normal)
        prevButton.backgroundColor = UIColor.lightGray

        nextButton.layer.cornerRadius = nextButton.bounds.height * 0.5
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.backgroundColor = UIColor.darkText
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // swiftlint:disable:next force_cast
        pageController = segue.destination as! UIPageViewController
    }

}

extension CalendarViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        return nil
    }

}
