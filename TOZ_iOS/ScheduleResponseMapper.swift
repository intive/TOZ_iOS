//
//  ScheduleResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ScheduleResponseMapper: ArrayResponseMapper<ReservationItem>, ResponseMapperProtocol {

    // swiftlint:disable cyclomatic_complexity
    static func process(_ obj: AnyObject?) throws -> [ReservationItem] {
        guard let reservationsNode = obj?["reservations"] as? [[String: AnyObject]] else {
            return [] }

        let reservationsParsed = try process(reservationsNode as AnyObject, mapper: { json in
            guard let idObject = json["id"] as? String else { throw ResponseMapperError.invalid }
            guard let dateFromJson = json["date"] as? String else { throw ResponseMapperError.invalid }
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.timeZone = TimeZone(abbreviation: "UTC")
            guard let date = formatter.date(from: dateFromJson) else { throw ResponseMapperError.invalid }
            guard let startTime = json["startTime"] as? String else { throw ResponseMapperError.invalid }
            var timeOfDay: TimeOfDay
            if startTime == "08:00" {
                timeOfDay = TimeOfDay.morning
            } else {
                timeOfDay = TimeOfDay.afternoon
            }
            var ownerForename: String?
            if let ownerForenameCheck = json["ownerName"] as? String {
                ownerForename = ownerForenameCheck
            }
            var ownerSurname: String?
            if let ownerSurnameCheck = json["ownerSurname"] as? String {
                ownerSurname = ownerSurnameCheck
            }
            return ReservationItem.init(idObject: idObject, date: date, timeOfDay: timeOfDay, ownerSurname: ownerSurname, ownerForename: ownerForename)
        })
        return reservationsParsed
    }

}
