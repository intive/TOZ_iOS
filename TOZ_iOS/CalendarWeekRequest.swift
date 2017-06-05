//
//  CalendarWeekRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class CalendarWeekRequest: BackendAPIRequest {

    private let fromDate: String
    private let toDate: String

    init(fromDate: String, toDate: String) {
        self.fromDate = fromDate
        self.toDate = toDate
    }

    var endpoint: String {
        return "/schedule"
    }
    var method: NetworkService.Method {
        return .GET
    }
    var parameters: [String: Any]? {
        return ["from": fromDate, "to": toDate]
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
