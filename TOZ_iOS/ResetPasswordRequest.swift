//
//  ResetPasswordRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ResetPasswordRequest: BackendAPIRequest {

    private let email: String

    init(email: String) {
        self.email = email
    }
//Will be changed when possible
    var endpoint: String {
        return "/users/passwords/reset/send"
    }

    var method: NetworkService.Method {
        return .POST
    }

    var parameters: [String: Any]? {
        return [
            "email": email
        ]
    }

    var headers: [String: String]? {
        return defaultJSONHeaders()
    }

    var queryItems: [URLQueryItem]?
}
