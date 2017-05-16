//
//  ResetPasswordRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ResetPasswordRequest: BackendAPIRequest {

    private let email: String
    private let login: String

    init(email: String, login: String) {
        self.email = email
        self.login = login
    }

    var endpoint: String {
        return "/users/passwordReset"
    }

    var method: NetworkService.Method {
        return .POST
    }

    var parameters: [String: Any]? {
        return [
            "email": email,
            "login": login
        ]
    }

    var headers: [String: String]? {
        return defaultJSONHeaders()
    }

}
