//
//  CalendarViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit
import Foundation

class CalendarViewController: UIViewController {

    @IBOutlet weak var prevButtonVar: UIButton!

    @IBOutlet weak var nextButtonVar: UIButton!

    @IBOutlet weak var currDateLabel: UILabel!

    var pageController: UIPageViewController!
    var weekPages = [WeekViewController]()
    private var indexPage = 0

    @IBAction func nextWeek(_ sender: Any) {
       pageController.setViewControllers([nextWeekController()], direction: .forward, animated: true, completion: nil)
    }

    @IBAction func previousWeek(_ sender: Any) {
        pageController.setViewControllers([nextWeekController()], direction: .reverse, animated: true, completion: nil)
    }

    func nextWeekController() -> WeekViewController {
        indexPage -= 1
        indexPage = abs(indexPage)

        return weekPages[indexPage]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // swiftlint:disable:next force_cast
        pageController = self.childViewControllers.first as! UIPageViewController
        pageController.dataSource = self
        // swiftlint:disable:next force_cast
        let weekAfter: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as! WeekViewController
        // swiftlint:disable:next force_cast
        let weekBefore: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as! WeekViewController

        weekPages.append(weekBefore)
        weekPages.append(weekAfter)
        //set initial view
        pageController.setViewControllers([weekBefore], direction: .forward, animated: true, completion: nil)
    }

    override func viewDidLayoutSubviews() {
        configureLayout()
    }

    func configureLayout() {
        prevButtonVar.layoutIfNeeded()
        prevButtonVar.layer.cornerRadius = prevButtonVar.bounds.height * 0.5
        prevButtonVar.setTitleColor(UIColor.darkGray, for: .normal)
        prevButtonVar.backgroundColor = UIColor.lightGray

        nextButtonVar.layoutIfNeeded()
        nextButtonVar.layer.cornerRadius = nextButtonVar.bounds.height * 0.5
        nextButtonVar.setTitleColor(UIColor.white, for: .normal)
        nextButtonVar.backgroundColor = UIColor.darkText

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
