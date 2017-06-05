//
//  BecomeVolunteerRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class BecomeVolunteerRequest: BackendAPIRequest {

    var endpoint: String {
        return "/organization/becomevolunteer"
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
