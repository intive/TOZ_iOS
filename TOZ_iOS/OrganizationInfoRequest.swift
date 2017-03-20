//
//  OrganizationInfoRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class OrganizationInfoRequest: BackendAPIRequest {

    var endpoint: String {
        return "/people/1"
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
}
