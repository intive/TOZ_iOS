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

            var listOfObjects = [AnyObject]()
            guard let arrayOfReservations = jsonNode["reservations"] as? [[String: AnyObject]]? else { return nil }
            for resItem in arrayOfReservations! {
                guard let idObject = resItem["id"] as? String? else { return nil }
                guard let date = resItem["date"] as? Date? else { return nil }
                guard let startTime = resItem["startTime"] as? String? else { return nil }
                guard let endTime = resItem["endTime"] as? String? else { return nil }
                var partDay: PartDay
                if (startTime == "08:00" || endTime == "17:00") {
                    partDay = PartDay.morning
                } else {
                    partDay = PartDay.afternoon
                }
                guard let ownerForename = resItem["ownerForename"] as? String? else { return nil }
                guard let ownerSurname = resItem["ownerSurname"] as? String? else { return nil }
                let oneItem = ScheduleItem.ReservationItem(idObject: idObject!, date: date!, partDay: partDay, ownerSurname: ownerSurname!, ownerForename: ownerForename!)
                listOfObjects.append(oneItem as AnyObject)
            }

            struct ReservationItem {
                var idObject: String
                var date: Date
                var partDay: PartDay
                var ownerSurname: String
                var ownerForename: String
            }
            return ScheduleItem(reservation: listOfObjects as? [ScheduleItem.ReservationItem])
        })
    }
}
