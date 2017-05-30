//
//  OrganizationInfoRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation
/**
 Provides informations to make GET request for informations about Organization
 */
final class OrganizationInfoRequest: BackendAPIRequest {

    var endpoint: String {
        return "/organization/info"
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
