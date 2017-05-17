//
//  ReservationItem.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum TimeOfDay {
    case morning
    case afternoon
}

struct ReservationItem: ParsedItem {
    var idObject: String
    var date: Date
    var timeOfDay: TimeOfDay
    var ownerSurname: String?
    var ownerForename: String?
}

extension ReservationItem: Equatable {

    static func == (lhs: ReservationItem, rhs: ReservationItem) -> Bool {
        return lhs.date == rhs.date && lhs.timeOfDay == rhs.timeOfDay && lhs.ownerForename == rhs.ownerForename && lhs.ownerSurname == rhs.ownerSurname
    }
}
