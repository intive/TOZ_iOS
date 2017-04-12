//
//  CalendarWeekRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class CalendarWeekRequest: BackendAPIRequest {

    private let from: String
    private let to: String

    init(from: String, to: String) {
        self.from = from
        self.to = to
    }

    var endpoint: String {
        return "/schedule"
    }
    var method: NetworkService.Method {
        return .GET
    }
    var parameters: [String: Any]? {
        var params = [String: Any]()
        params["from"] = from
        params["to"] = to

        return params
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
