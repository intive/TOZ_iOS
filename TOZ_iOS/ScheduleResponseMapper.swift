//
//  CalendarResponseMapper.swift
//  TOZ_iOS
//
//  Created by RKB on 11/04/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ScheduleResponseMapper: ArrayResponseMapper<ScheduleItem.ReservationItem>, ResponseMapperProtocol {

    // swiftlint:disable cyclomatic_complexity
    static func process(_ obj: AnyObject?) throws -> [ScheduleItem.ReservationItem] {
        guard let reservationsNode = obj?["reservations"] as? [[String: AnyObject]] else { throw ResponseMapperError.invalid }

        let reservationsParsed = try process(reservationsNode as AnyObject, mapper: { json in
            guard let idObject = json["id"] as? String else { return nil }
            guard let dateFromJson = json["date"] as? String else { return nil }
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.timeZone = TimeZone(abbreviation: "UTC")
            guard let date = formatter.date(from: dateFromJson) else { return nil }
            guard let startTime = json["startTime"] as? String else { return nil }
            guard let endTime = json["endTime"] as? String else { return nil }
            var timeOfDay: TimeOfDay
            if startTime == "08:00" && endTime == "12:00" {
                timeOfDay = TimeOfDay.morning
            } else {
                timeOfDay = TimeOfDay.afternoon
            }
            var ownerForename: String?
            if let ownerForenameCheck = json["ownerForename"] as? String {
                ownerForename = ownerForenameCheck
            }
            var ownerSurname: String?
            if let ownerSurnameCheck = json["ownerSurname"] as? String {
                ownerSurname = ownerSurnameCheck
            }
            return ScheduleItem.ReservationItem.init(idObject: idObject, date: date, timeOfDay: timeOfDay, ownerSurname: ownerSurname, ownerForename: ownerForename)
        })
        return reservationsParsed
    }

}
