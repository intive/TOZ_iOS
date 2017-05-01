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
    var contents: [ScheduleItem.ReservationItem] = []
    var weekdayArray: [String]! {
        didSet {
            //Calendar Help function to parse MONTH and YEAR
            //albo i nie
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dateFromString = formatter.date(from: weekdayArray[0])
            formatter.dateFormat = "MMMM yyyy"
            currentDateLabel.text = formatter.string(from: dateFromString!)
        }
    }

    @IBAction func nextWeek(_ sender: Any) {
        //Add calendarhelper with data week range for selected week
        weekdayArray = ["2017-05-01", "2017-05-02", "2017-05-03", "2017-05-04", "2017-05-05", "2017-05-06", "2017-05-07"]
        //Add calendar datasource class instance
        contents.append(ScheduleItem.ReservationItem.init(idObject:"11", date: Calendar.current.date(byAdding: .day, value: +2, to: Date())!, timeOfDay: TimeOfDay.afternoon, ownerSurname: "Name", ownerForename: "First" ))
        pageController.setViewControllers([nextWeekController()], direction: .forward, animated: true)
        if let currentWeekController = pageController.viewControllers?.first as? WeekViewController {
            currentWeekController.weekdayArray = weekdayArray
            currentWeekController.contentsWeekController = contents
        }
    }

    @IBAction func previousWeek(_ sender: Any) {
        //Add calendarhelper with data week range for selected week
        weekdayArray = ["2017-04-17", "2017-04-18", "2017-04-19", "2017-04-20", "2017-04-21", "2017-04-22", "2017-05-23"]
        //Add calendar datasource class instance

        pageController.setViewControllers([nextWeekController()], direction: .reverse, animated: true)
        if let currentWeekController = pageController.viewControllers?.first as? WeekViewController {
            currentWeekController.weekdayArray = weekdayArray
            currentWeekController.contentsWeekController = contents
        }

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
        weekdayArray = ["2017-04-24", "2017-04-25", "2017-04-26", "2017-04-27", "2017-04-28", "2017-04-29", "2017-04-30"]
        //Add calendar datasource class instance with result for selected range of dates
        contents.append(ScheduleItem.ReservationItem.init(idObject:"11", date: Calendar.current.date(byAdding: .day, value: +0, to: Date())!, timeOfDay: TimeOfDay.morning, ownerSurname: "Guten", ownerForename: "Tag" ))

        weekBefore.weekdayArray = weekdayArray
        weekBefore.contentsWeekController = contents
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
    func didUpdateContents(_ sender: WeekViewController) {
        contents = sender.contentsWeekController
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
