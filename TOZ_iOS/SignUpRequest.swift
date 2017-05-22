//
//  SignUpRequest.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class SignUpRequest: BackendAPIRequest {

    private let password: String
    private let name: String
    private let surname: String
    private let phoneNumber: String
    private let email: String

    init(password: String, name: String, surname: String,
         phoneNumber: String, email: String) {
        self.password = password
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.email = email
    }
    var endpoint: String {
        return "/users"
    }
    var method: NetworkService.Method {
        return .POST
    }
    var parameters: [String: Any]? {
        return [
            "password": password,
            "name": name,
            "surname": surname,
            "phoneNumber": phoneNumber,
            "email": email        ]
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
