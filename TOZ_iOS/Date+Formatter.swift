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
        let components = calendar.dateComponents([.day, .hour, .minute], from: self, to: now)
        var result: String = ""
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0

        if day <= 1 {
            result = "\(abs(components.hour ?? 0)) godzin temu"
        } else if hour <= 1 {
            result = "\(abs(components.minute ?? 0)) minut temu"
        } else if minute <= 1 {
            result = "przed chwilą"
        } else {
            result = formatter.string(from: self)
        }

        return result
    }
}
