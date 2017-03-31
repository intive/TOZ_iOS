//
//  CalendarViewController.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {

    @IBAction func nextWeek(_ sender: Any) {
        currentCalendar.nextWeek()
        updateUX()
        nextPage()
    }

    @IBAction func previousWeek(_ sender: Any) {
        currentCalendar.previousWeek()
        updateUX()
        previousPage()
    }

    @IBOutlet weak var currDateLabel: UILabel!

    var currentCalendar: CalendarDataSource!
    var pageBoss: CalendarPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        pageBoss = self.childViewControllers.first as? CalendarPageViewController

        currentCalendar = CalendarDataSource(date: Date())
        configureUX()
    }

    func nextPage() {
        pageBoss.setViewControllers([pageBoss.weekPages[pageBoss.getNextIndex()]], direction: .forward, animated: true, completion: nil)
    }

    func previousPage() {
        pageBoss.setViewControllers([pageBoss.weekPages[pageBoss.getPreviousIndex()]], direction: .reverse, animated: true, completion: nil)
    }

    func configureUX() {
        currDateLabel.text = currentCalendar.getStringfromDate(date: currentCalendar.getCurrentDay(), format: "MMMM YYYY")
    }

    func updateUX() {
        currDateLabel.text = currentCalendar.getStringfromDate(date: currentCalendar.getCurrentDay(), format: "MMMM YYYY")
    }

}

class CalendarDataSource {

    var currentCalendar: Calendar
    var currentDate: Date
    var currentWeek: Int

    init(date: Date) {
        currentDate = Date()
        currentCalendar = Calendar.current
        currentWeek = currentCalendar.component(.weekday, from: currentDate)
    }

    func setCurrentDate(date: Date) {
        currentDate = date
    }

    func getCurrentWeek() -> [Date] {
        let dayWeek = currentCalendar.component(.weekday, from: currentDate)
        let dayFromMon = (dayWeek != 1 ? dayWeek-2 : 7)
        let monday = currentCalendar.date(byAdding: .day, value: -dayFromMon, to: currentDate)!
        var daysInWeek: [Date] = []
        for i in 0...6 {
            daysInWeek.append(currentCalendar.date(byAdding: .day, value: i, to: monday)!)
        }

        return daysInWeek
    }

    func getCurrentDay() -> Date {
        return currentDate
    }

    func nextWeek() {
        currentDate = currentCalendar.date(byAdding: .weekOfYear, value: 1, to: currentDate)!
        currentWeek = currentCalendar.component(.weekOfYear, from: currentDate)
    }

    func previousWeek() {
        currentDate = currentCalendar.date(byAdding: .weekOfYear, value: -1, to: currentDate)!
        currentWeek = currentCalendar.component(.weekOfYear, from: currentDate)
    }

    func getStringfromDate(date: Date, format: String = "yyyy-MM-dd") -> String {
        let dateToString = DateFormatter()
        dateToString.dateFormat = format

        return dateToString.string(from: date)
    }

}
