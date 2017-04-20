//
//  CalendarItem.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum TimeOfDay {
    case morning
    case afternoon
}

struct ScheduleItem: ParsedItem {

    struct ReservationItem: ParsedItem {
        var idObject: String
        var date: Date
        var timeOfDay: TimeOfDay
        var ownerSurname: String
        var ownerForename: String
    }

    var reservations: [ReservationItem]?

}
