//
//  CalendarItem.swift
//  TOZ_iOS
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

struct CalendarItem: ParsedItem {
    struct ReservationItem {
        var date: Date
        var startTime: Date
        var endTime: Date
        var ownerId: String
        var modificationMessage: String
        var id: String
        var created: Int
        var lastModified: Int
        var modificationAuthorId: String
    }

    struct ConfigsItem {
        var dayOfWeek: [[String: AnyObject]]
        var numberOfPeriods: Int
    }

    var reservation: [ReservationItem]?

}
