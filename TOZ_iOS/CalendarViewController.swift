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

        for i in 0...6 {
            guard let dayOfweek = (pageBoss.weekPages[pageBoss.indexPage].calendarStack.arrangedSubviews[i] as? WeekDayView)?.dayOfweek else { return }
            dayOfweek.text = calendarDataUI[i].dayOfWeek
            guard let valueOfDay = (pageBoss.weekPages[pageBoss.indexPage].calendarStack.arrangedSubviews[i] as? WeekDayView)?.valueOfDay else { return }
            valueOfDay.setTitle(calendarDataUI[i].date, for: .normal)
            if (currentCalendar.getDay()) == i {
                valueOfDay.backgroundColor = UIColor.white
                valueOfDay.setTitleColor(UIColor.darkGray, for: .normal)
                dayOfweek.textColor = UIColor.white
            }

            guard let switchControlTop = (pageBoss.weekPages[pageBoss.indexPage].scheduleMorning.arrangedSubviews[i] as? ScheduleView)?.switchControl else { return }
            if calendarDataUI[i].morning {
                switchControlTop.backgroundColor = UIColor.darkGray
                switchControlTop.setTitle(calendarDataUI[i].ownerId, for: .normal)
            } else {
                switchControlTop.backgroundColor = UIColor.white
                switchControlTop.setTitle(calendarDataUI[i].ownerId, for: .normal)
            }
            guard let switchControlBottom = (pageBoss.weekPages[pageBoss.indexPage].scheduleAfternoon.arrangedSubviews[i] as? ScheduleView)?.switchControl else { return }
            if calendarDataUI[i].afterNoon {
                switchControlBottom.backgroundColor = UIColor.darkGray
                switchControlBottom.setTitle(calendarDataUI[i].ownerId, for: .normal)
            } else {
                switchControlBottom.backgroundColor = UIColor.white
                switchControlBottom.setTitle(calendarDataUI[i].ownerId, for: .normal)
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
