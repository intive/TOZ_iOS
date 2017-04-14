//
//  CalendarItem.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum PartDay {
    case morning
    case afternoon
}

struct ScheduleItem: ParsedItem {

    struct ReservationItem {
        var idObject: String
        var date: Date
        var partDay: PartDay
        var ownerSurname: String
        var ownerForename: String
    }

    var reservation: [ReservationItem]?

}
