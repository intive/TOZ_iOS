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

    var endpoint: String {
        return "/users/emails"
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

}
