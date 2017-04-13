//
//  AddScheduleRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class AddScheduleRequest: BackendAPIRequest {

    private let idObject: String
    private let dataObject: CalendarItem

    init(idObject: String, dataObject: CalendarItem) {
        self.idObject = idObject
        self.dataObject = dataObject
    }

    var endpoint: String {
        return "/schedule"
    }
    var method: NetworkService.Method {
        return .POST
    }
    var parameters: [String: Any]? {

        return nil
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
