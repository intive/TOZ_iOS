//
//  GetScheduleRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class GetScheduleRequest: BackendAPIRequest {

    private let idObject: String

    init(idObject: String) {
        self.idObject = idObject
    }

    var endpoint: String {
        return "/schedule/\(idObject)"
    }
    var method: NetworkService.Method {
        return .GET
    }
    var parameters: [String: Any]? {

        return nil
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
    var queryItems: [URLQueryItem]?
}
