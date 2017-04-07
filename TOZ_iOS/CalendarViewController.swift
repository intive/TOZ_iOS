//
//  CalendarViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBOutlet weak var prevButtonVar: UIButton!

    @IBOutlet weak var nextButtonVar: UIButton!

    @IBAction func nextWeek(_ sender: Any) {
        currentCalendar.nextWeek()
        nextPage()
    }

    @IBAction func previousWeek(_ sender: Any) {
        currentCalendar.previousWeek()
        previousPage()
    }

    @IBOutlet weak var currDateLabel: UILabel!

    var currentCalendar: CalendarHelper = CalendarHelper(date: Date()) {
        didSet {
            updateUX()
        }
    }

    var pageBoss: CalendarPageViewController!

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

        var calendarService = CalendarService()

        prevButtonVar.layer.cornerRadius = prevButtonVar.bounds.height * 0.4
        nextButtonVar.layer.cornerRadius = nextButtonVar.bounds.height * 0.4

        pageBoss = self.childViewControllers.first as? CalendarPageViewController

        let week = currentCalendar.getCurrentWeek()
        calendarData = requestWeeklyData(with: week[0], to: week[6])
        //calendarData = calendarService.requestWeeklyData(with: week[0], to: week[6])!
        calendarDataUI = mapRequestDataToUI(from: calendarData)
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
        calendarData = requestWeeklyData(with: week[0], to: week[6])
        pageBoss.setViewControllers([pageBoss.weekPages[pageBoss.getNextIndex()]], direction: .forward, animated: true, completion: nil)
    }

    func previousPage() {
        let week = currentCalendar.getCurrentWeek()
        calendarData = requestWeeklyData(with: week[0], to: week[6])
        pageBoss.setViewControllers([pageBoss.weekPages[pageBoss.getPreviousIndex()]], direction: .reverse, animated: true, completion: nil)
    }

    func updateUX() {

        currDateLabel.text = currentCalendar.getStringfromDate(date: currentCalendar.getCurrentDay(), format: "MMMM YYYY")

        let weekDayViews = pageBoss.weekPages[pageBoss.indexPage].weekDayViews
        for dayAfterDay in weekDayViews! {
            dayAfterDay.dayOfweek.text = calendarDataUI[dayAfterDay.tag].dayOfWeek
            dayAfterDay.valueOfDay.setTitle(calendarDataUI[dayAfterDay.tag].date, for: .normal)
            if (currentCalendar.getDay()) == dayAfterDay.tag {
                dayAfterDay.valueOfDay.backgroundColor = UIColor.white
                dayAfterDay.valueOfDay.setTitleColor(UIColor.darkGray, for: .normal)
                dayAfterDay.dayOfweek.textColor = UIColor.white
            }
        }

        let scheduleMoringViews = pageBoss.weekPages[pageBoss.indexPage].scheduleMoringViews
        for scheduleItem in scheduleMoringViews! {
            if calendarDataUI[scheduleItem.tag].morning {
                scheduleItem.switchControl.backgroundColor = UIColor.darkGray
            } else {
                scheduleItem.switchControl.backgroundColor = UIColor.white
                scheduleItem.switchControl.setTitle(calendarDataUI[scheduleItem.tag].ownerId, for: .normal)
            }
        }

        let scheduleAfterViews = pageBoss.weekPages[pageBoss.indexPage].scheduleAfterViews
        for scheduleItem in scheduleAfterViews! {
            if calendarDataUI[scheduleItem.tag].afterNoon {
                scheduleItem.switchControl.backgroundColor = UIColor.darkGray
                scheduleItem.switchControl.setTitle(calendarDataUI[scheduleItem.tag].ownerId, for: .normal)
            } else {
                scheduleItem.switchControl.backgroundColor = UIColor.white
                scheduleItem.switchControl.setTitle(calendarDataUI[scheduleItem.tag].ownerId, for: .normal)
            }
        }

    }

}

struct CalendarDataUI {

    var dayOfWeek: String
    var date: String
    var morning: Bool
    var afterNoon: Bool
    var ownerId: String

}
