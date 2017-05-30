//
//  ChangePasswordRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ChangePasswordRequest: BackendAPIRequest {

    private let oldPassword: String
    private let newPassword: String

    init(oldPassword: String, newPassword: String) {
        self.oldPassword = oldPassword
        self.newPassword = newPassword
    }

    var endpoint: String {
        return "/users/passwords"
    }

    var method: NetworkService.Method {
        return .POST
    }

    var parameters: [String: Any]? {
        return [
            "oldPassword": oldPassword,
            "newPassword": newPassword
        ]
    }

    var headers: [String: String]? {
        return defaultJSONHeaders()
    }

    var queryItems: [URLQueryItem]?
}
