//
//  CalendarResponseMapper.swift
//  TOZ_iOS
//
//  Created by RKB on 11/04/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class CalendarResponseMapper: ArrayResponseMapper<CalendarItem>, ResponseMapperProtocol {

    // swiftlint:disable cyclomatic_complexity
    static func process(_ obj: AnyObject?) throws -> [CalendarItem] {
        return try process(obj, mapper: { jsonNode in

            var listOfObjects = [AnyObject]()
            guard let arrayOfReservations = jsonNode["reservations"] as? [[String: AnyObject]]? else { return nil }
            for resItem in arrayOfReservations! {
                guard let date = resItem["date"] as? Date? else { return nil }
                let stringToDate = DateFormatter()
                stringToDate.dateFormat = "HH:mm"
                guard let startTimeTmp = resItem["startTime"] as? String? else { return nil }
                let startTime = stringToDate.date(from: startTimeTmp!)
                guard let endTimeTmp = resItem["endTime"] as? String? else { return nil }
                let endTime = stringToDate.date(from: endTimeTmp!)
                guard let ownerId = resItem["ownerId"] as? String? else { return nil }
                guard let modificationMessage = resItem["modificationMessage"] as? String else { return nil }
                guard let idSchedule = resItem["id"] as? String? else { return nil }
                guard let created = resItem["created"] as? Int? else { return nil }
                guard let lastModified = resItem["lastModified"] as? Int? else { return nil }
                guard let modificationAuthorId = resItem["modificationAuthorId"] as? String? else { return nil }

                let oneItem = CalendarItem.ReservationItem(date: date!, startTime: startTime, endTime: endTime, ownerId: ownerId!, modificationMessage: modificationMessage, idSchedule: idSchedule!, created: created!, lastModified: lastModified, modificationAuthorId: modificationAuthorId)
                listOfObjects.append(oneItem as AnyObject)
            }

            return CalendarItem(reservation: listOfObjects as? [CalendarItem.ReservationItem])
        })
    }
}
