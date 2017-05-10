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
        formatter.dateFormat = "d/MM/YYYY"
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: self, to: now)
        var result: String = ""
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0

        if day >= 7 {
            result = formatter.string(from: self)
        } else if day >= 1 {
            result = "\(abs(components.day ?? 0)) dni temu"
        } else if hour >= 1 {
            result = "\(abs(components.hour ?? 0)) godzin temu"
        } else if minute >= 1 {
            result = "\(abs(components.minute ?? 0)) minut temu"
        } else if second >= 0 {
            result = "Przed chwilą"
        }
        return result
    }
}
