//
//  CalendarHelper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class CalendarHelper {

    //var currentCalendar: Calendar!
    let calendar = Calendar.current
    var currentMonday: Date!

    init(date: Date = Date()) {
        let currentWeekday = calendar.component(.weekday, from: date)
        let distanceFromMonday = (currentWeekday != 1 ? currentWeekday - 2 : 6)
        currentMonday = calendar.date(byAdding: .day, value: -distanceFromMonday, to: date)!
    }

    func weekdayItemArray() -> [WeekdayItem] {

        var daysInWeek: [WeekdayItem] = []
        for i in 0...6 {
            let addNewItem = WeekdayItem(from: calendar.date(byAdding: .day, value: i, to: currentMonday)!)
            daysInWeek.append(addNewItem)
        }

        return daysInWeek
    }

    func date(from weekdayItem: WeekdayItem) -> Date {
        var components = DateComponents()

        components.day = Int(weekdayItem.day)
        components.month = Int(weekdayItem.month)
        components.year = Int(weekdayItem.year)
        components.calendar = Calendar.current
        components.timeZone = TimeZone(abbreviation: "UTC")

        return components.date!
    }

    func nextWeek() {
        currentMonday = calendar.date(byAdding: .weekOfYear, value: 1, to: currentMonday)!
    }

    func previousWeek() {
        currentMonday = calendar.date(byAdding: .weekOfYear, value: -1, to: currentMonday)!
    }

}
