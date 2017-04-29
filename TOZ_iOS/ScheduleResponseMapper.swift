//
//  CalendarResponseMapper.swift
//  TOZ_iOS
//
//  Created by RKB on 11/04/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ScheduleResponseMapper: ArrayResponseMapper<ScheduleItem>, ResponseMapperProtocol {

    // swiftlint:disable cyclomatic_complexity
    static func process(_ obj: AnyObject?) throws -> [ScheduleItem] {
        return try process(obj, mapper: { jsonNode in

            var listOfObjects = Array<ScheduleItem.ReservationItem>()
            guard let arrayOfReservations = jsonNode["reservations"] as? [[String: AnyObject]]? else { return nil }
            for resItem in arrayOfReservations! {
                guard let idObject = resItem["id"] as? String else { return nil }
                guard let date = resItem["date"] as? Date else { return nil }
                guard let startTime = resItem["startTime"] as? String else { return nil }
                guard let endTime = resItem["endTime"] as? String else { return nil }
                var timeOfDay: TimeOfDay
                if startTime == "08:00" || endTime == "12:00" {
                    timeOfDay = TimeOfDay.morning
                } else {
                    timeOfDay = TimeOfDay.afternoon
                }
                guard let ownerForename = resItem["ownerForename"] as? String else { return nil }
                guard let ownerSurname = resItem["ownerSurname"] as? String else { return nil }
                let oneItem = ScheduleItem.ReservationItem(idObject: idObject, date: date, timeOfDay: timeOfDay, ownerSurname: ownerSurname, ownerForename: ownerForename)
                listOfObjects.append(oneItem)
            }

            return ScheduleItem(reservations: listOfObjects)
        })
    }
}
