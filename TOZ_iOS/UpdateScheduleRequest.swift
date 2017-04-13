//
//  UpdateScheduleRequest.swift
//  TOZ_iOS
//
//  Created by RKB on 13/04/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class UpdateScheduleRequest: BackendAPIRequest {

    private let idObject: String
    private let dataObject: CalendarItem

    init(idObject: String, dataObject: CalendarItem) {
        self.idObject = idObject
        self.dataObject = dataObject
    }

    var endpoint: String {
        return "/schedule/\(idObject)"
    }
    var method: NetworkService.Method {
        return .PUT
    }
    var parameters: [String: Any]? {
        return nil
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }

}
