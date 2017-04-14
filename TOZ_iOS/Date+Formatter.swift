//
//  Date+Formatter.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

extension Date {

    func dateToFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.day, .hour, .minute], from: self, to: now as Date)
        var result: String = ""

        if components.day! <= 1 {
            result = "\(components.hour!) godzin temu"
        } else if components.hour! <= 1 {
            result = "\(components.minute!)) minut temu"
        } else if components.minute! <= 1 {
            result = "przed chwilą"
        } else {
            result = formatter.string(from: self)
        }

        return result
    }
}
