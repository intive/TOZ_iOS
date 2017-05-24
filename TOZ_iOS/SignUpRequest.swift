//
//  SignUpRequest.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class SignUpRequest: BackendAPIRequest {

    private let name: String
    private let surname: String
    private let phoneNumber: String
    private let email: String
    private let roles: [Role]

    init(name: String, surname: String,
         phoneNumber: String, email: String, roles: [Role]) {
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.email = email
        self.roles = roles
    }
    var endpoint: String {
        return "/users"
    }
    var method: NetworkService.Method {
        return .POST
    }
    var parameters: [String: Any]? {
        return [
            "name": name,
            "surname": surname,
            "phoneNumber": phoneNumber,
            "email": email,
            "roles": roles.map {$0.rawValue}
        ]
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
