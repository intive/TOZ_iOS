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
    var reservations: [ScheduleItem.ReservationItem] = []
    var weekdayArray: [WeekdayItem]! {
        didSet {
            //Calendar Help function to parse MONTH and YEAR
            if (weekdayArray?.isEmpty)! {
                currentDateLabel.text = ""
            } else {
                currentDateLabel.text = weekdayArray?[0].dataLabel
            }
        }
    }

    @IBAction func nextWeek(_ sender: Any) {
        //Add calendarhelper with data week range for selected week

        //Add calendar datasource class instance

        let currentWeekController = nextWeekController()
        currentWeekController.weekdayArray = weekdayArray
        currentWeekController.reservations = reservations
        pageController.setViewControllers([currentWeekController], direction: .forward, animated: true)
    }

    @IBAction func previousWeek(_ sender: Any) {
        //Add calendarhelper with data week range for selected week
        weekdayArray = []
        //Add calendar datasource class instance

        let currentWeekController = nextWeekController()
        currentWeekController.weekdayArray = weekdayArray
        currentWeekController.reservations = reservations
        pageController.setViewControllers([currentWeekController], direction: .reverse, animated: true)
    }

    func nextWeekController() -> WeekViewController {
        indexPage -= 1
        indexPage = abs(indexPage)

        return weekPages[indexPage]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        pageController.dataSource = self
        // swiftlint:disable:next force_cast
        let weekAfter: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as! WeekViewController
        // swiftlint:disable:next force_cast
        let weekBefore: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as! WeekViewController

        weekPages.append(weekBefore)
        weekPages.append(weekAfter)
        weekBefore.delegate = self
        weekAfter.delegate = self

        //Add calendarhelper with data week range for selected week
        weekdayArray = []
        //Add calendar datasource class instance with result for selected range of dates

        weekBefore.weekdayArray = weekdayArray
        weekBefore.reservations = reservations
        //set initial view
        pageController.setViewControllers([weekBefore], direction: .forward, animated: true)

    }

    override func viewDidLayoutSubviews() {
        prevButton.setTitleColor(Color.Calendar.PreviousButton.text, for: .normal)
        prevButton.backgroundColor = Color.Calendar.PreviousButton.background
        nextButton.setTitleColor(Color.Calendar.NextButton.text, for: .normal)
        nextButton.backgroundColor = Color.Calendar.NextButton.background

        prevButton.layer.cornerRadius = prevButton.bounds.height * 0.5
        nextButton.layer.cornerRadius = nextButton.bounds.height * 0.5
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // swiftlint:disable:next force_cast
        pageController = segue.destination as! UIPageViewController
    }

}

extension CalendarViewController: WeekViewControllerDelegate {
    func didUpdateReservations(_ controller: WeekViewController, didUpdate reservations: [ScheduleItem.ReservationItem]) {
        self.reservations = controller.reservations
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
