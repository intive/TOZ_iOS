//
//  CalendarHelper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class CalendarHelper {

    var currentCalendar: Calendar!
    var currentMonday: Date!

    init() {
        currentCalendar = Calendar.current
        let currentWeek = currentCalendar.component(.weekday, from: Date())
        let distanceFromMonday = (currentWeek != 1 ? currentWeek - 2 : 7)
        currentMonday = currentCalendar.date(byAdding: .day, value: -distanceFromMonday, to: Date())!
    }

    func isDatesEqual(fistDate: WeekdayItem, with secondDate: WeekdayItem) -> Bool {
        if fistDate.day == secondDate.day && fistDate.month == secondDate.month && fistDate.year == secondDate.year {
            return true
        } else {
            return false
        }
    }

    func weekdayItemArray() -> [WeekdayItem] {

        var daysInWeek: [WeekdayItem] = []
        for i in 0...6 {
            let addNewItem = weekdayItem(from: currentCalendar.date(byAdding: .day, value: i, to: currentMonday)!)
            daysInWeek.append(addNewItem)
        }

        return daysInWeek
    }

    func weekdayItem(from date: Date) -> WeekdayItem {
        var components = currentCalendar.dateComponents([.year, .month, .day], from: date)
        var dayComponent: Int = 0
        var monthComponent: Int = 0
        var yearComponent: Int = 0
        var dataLabel: String
        var day, month, year: String
        if let check = components.day {
            dayComponent = check
        }
        if let check = components.month {
            monthComponent = check
        }
        if let check = components.year {
            yearComponent = check
        }
        if dayComponent < 10 {
            day = "0" + String(dayComponent)
        } else {
            day = "\(dayComponent)"
        }
        if monthComponent < 10 {
            month = "0\(monthComponent)"
        } else {
            month = "\(monthComponent)"
        }
        year = "\(yearComponent)"
        dataLabel = "\(year)-\(month)-\(day)"

        let dateWeekdayItem = WeekdayItem(day: day, month: month, year: year, dataLabel: dataLabel)

        return dateWeekdayItem
    }

    func date(from weekdayItem: WeekdayItem) -> Date {
        var components = currentCalendar.dateComponents([.year, .month, .day], from: currentMonday)
        components.day = Int(weekdayItem.day)
        components.month = Int(weekdayItem.month)
        components.year = Int(weekdayItem.year)

        return currentCalendar.date(from: components)!
    }

    func nextWeek() {
        currentMonday = currentCalendar.date(byAdding: .weekOfYear, value: 1, to: currentMonday)!
    }

    func previousWeek() {
        currentMonday = currentCalendar.date(byAdding: .weekOfYear, value: -1, to: currentMonday)!
    }

}
