//
//  WeekdayItem.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

struct WeekdayItem {
    let day: String
    let month: String
    let year: String
    var dataLabel: String {
        return "\(year)-\(month)-\(day)"
    }
}

extension WeekdayItem: Equatable {

    init(from date: Date) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: date)

        day = String(format: "%02d", components.day!)
        month = String(format: "%02d", components.month!)
        year = String(format: "%d", components.year!)
    }

    static func == (lhs: WeekdayItem, rhs: WeekdayItem) -> Bool {
        return lhs.day == rhs.day && lhs.month == rhs.month && lhs.year == rhs.year
    }
}
