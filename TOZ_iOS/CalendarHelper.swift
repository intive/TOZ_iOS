//
//  CalendarHelper.swift
//  TOZ_iOS
//
//  Created by RKB on 03/04/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class CalendarHelper {

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
        let dayFromMon = getDay()
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

    func getDay() -> Int {
        let dayWeek = currentCalendar.component(.weekday, from: currentDate)
        let dayFromMon = (dayWeek != 1 ? dayWeek-2 : 7)
        return dayFromMon
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
