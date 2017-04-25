//
//  GGetScheduleResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class GetScheduleResponseMapper: ResponseMapper<ScheduleItem.ReservationItem>, ResponseMapperProtocol {
    // swiftlint:disable cyclomatic_complexity
    static func process(_ obj: AnyObject?) throws -> ScheduleItem.ReservationItem {
        return try process(obj, parse: { json in
            guard let idObject = json["id"] as? String else { return nil }
            guard let date = json["date"] as? Date else { return nil }
            guard let startTime = json["startTime"] as? String else { return nil }
            guard let endTime = json["endTime"] as? String else { return nil }
            var timeOfDay: TimeOfDay
            if startTime == "08:00" || endTime == "12:00" {
                timeOfDay = TimeOfDay.morning
            } else {
                timeOfDay = TimeOfDay.afternoon
            }
            guard let ownerForename = json["ownerForename"] as? String? else { return nil }
            guard let ownerSurname = json["ownerSurname"] as? String? else { return nil }
            return ScheduleItem.ReservationItem(idObject: idObject, date: date, timeOfDay: timeOfDay, ownerSurname: ownerSurname, ownerForename: ownerForename)
        })
    }
}
