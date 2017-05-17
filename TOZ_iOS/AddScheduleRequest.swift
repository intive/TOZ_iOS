//
//  AddScheduleRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class AddScheduleRequest: BackendAPIRequest {

    private let dataObject: ReservationItem

    init(dataObject: ReservationItem) {
        self.dataObject = dataObject
    }

    var endpoint: String {
        return "/schedule"
    }
    var method: NetworkService.Method {
        return .POST
    }
    var parameters: [String: Any]? {

        var startTime = ""
        var endTime = ""
        if dataObject.timeOfDay == .morning {
            startTime = "08:00"
            endTime   = "12:00"
        } else {
            startTime = "12:00"
            endTime   = "16:00"
        }

        return [
            "date": dataObject.date,
            "ownerSurname": dataObject.ownerSurname!,
            "ownerForename": dataObject.ownerForename!,
            "startTime": startTime,
            "endTime": endTime
        ]
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
