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

    @IBAction func nextWeek(_ sender: Any) {
        currentCalendar.nextWeek()
        nextPage()
        updateDate()
    }

    @IBAction func previousWeek(_ sender: Any) {
        currentCalendar.previousWeek()
        previousPage()
        updateDate()
    }

    @IBOutlet weak var currDateLabel: UILabel!

    var currentCalendar: CalendarHelper = CalendarHelper(date: Date()) {
        didSet {
            updateUX()
        }
    }

    var pageBoss: CalendarPageViewController!
    var weekPages = [WeekViewController]()
    var indexPage: Int = 0
    var indexDay: Int = 0
    var getNewIndexPage: Int {
        indexPage -= 1
        indexPage = abs(indexPage)

        return indexPage
    }

    var calendarData: [CalendarEntity] = [] {
        didSet {
            calendarDataUI = mapRequestDataToUI(from: calendarData)
        }
    }

    var calendarDataUI: [CalendarDataUI] = [] {
        didSet {
            updateUX()
        }
    }

    let calExamplRequest = Array.init(repeating: CalendarEntity(dayOfWeek: "M", date: "2017-11-12", morning: true, afterNoon: false, ownerId: "RK"), count: 7)

    let calExamplUI = Array.init(repeating: CalendarDataUI(dayOfWeek: "M", date: "12", morning: true, afterNoon: false, ownerId: "RK"), count: 7)

    override func viewDidLoad() {
        super.viewDidLoad()

        //var calendarService = CalendarService()

        prevButtonVar.layer.cornerRadius = prevButtonVar.bounds.height * 0.45
        nextButtonVar.layer.cornerRadius = nextButtonVar.bounds.height * 0.45

        pageBoss = self.childViewControllers.first as? CalendarPageViewController
        pageBoss.dataSource = self
        let weekAfter: WeekViewController = (self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as? WeekViewController)!
        guard let weekBefore: WeekViewController = self.storyboard?.instantiateViewController(withIdentifier: "WeekViewController") as? WeekViewController else { return }

        weekBefore.delegate = self
        weekAfter.delegate = self
        weekPages.append(weekBefore)
        weekPages.append(weekAfter)
        //set initial view
        pageBoss.setViewControllers([weekBefore], direction: .forward, animated: true, completion: nil)

        let week = currentCalendar.getCurrentWeek()
        updateDate()

        calendarData = requestWeeklyData(with: week[0], to: week[6])
        //calendarData = calendarService.requestWeeklyData(with: week[0], to: week[6])!
    }

    func requestWeeklyData(with fromDate: Date, to endDate: Date) -> [CalendarEntity] {

        return calExamplRequest
    }

    func mapRequestDataToUI(from requestData: [CalendarEntity]) -> [CalendarDataUI] {

        return calExamplUI
    }

    func mapUIToRequestData(from uiData: [CalendarDataUI]) -> [CalendarEntity] {

        return calExamplRequest
    }

    func nextPage() {
        let week = currentCalendar.getCurrentWeek()
        pageBoss.setViewControllers([weekPages[getNewIndexPage]], direction: .forward, animated: true, completion: nil)
        calendarData = requestWeeklyData(with: week[0], to: week[6])
    }

    func previousPage() {
        let week = currentCalendar.getCurrentWeek()
        pageBoss.setViewControllers([weekPages[getNewIndexPage]], direction: .reverse, animated: true, completion: nil)
        calendarData = requestWeeklyData(with: week[0], to: week[6])
    }

    func updateDate() {
        currDateLabel.text = currentCalendar.getStringfromDate(date: currentCalendar.getCurrentDay(), format: "MMMM YYYY")
    }

    func updateUX() {
        weekPages[indexPage].dataObj = calendarDataUI[indexDay]
        weekPages[indexPage].updateUX()
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

struct CalendarDataUI {

    var dayOfWeek: String
    var date: String
    var morning: Bool
    var afterNoon: Bool
    var ownerId: String

}
