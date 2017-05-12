//
//  SignUpRequest.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class SignUpRequest: BackendAPIRequest {
    
    private let id: String
    private let password: String
    private let roles: Array<String>
    private let name: String
    private let surname: String
    private let phoneNumber: String
    private let email: String
    private let passwordChangeDate: Int
    
    init(id: String, password: String, roles: Array<String>, name: String, surname: String,
         phoneNumber: String, email: String, passwordChangeDate:Int) {
        self.id = id
        self.password = password
        self.roles = roles
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.email = email
        self.passwordChangeDate = passwordChangeDate
    }
    var endpoint: String {
        return "/users"
    }
    var method: NetworkService.Method {
        return .POST
    }
    var parameters: [String: Any]? {
        return [
            "id": id,
            "password": password,
            "roles": roles,
            "name": name,
            "surname": surname,
            "phoneNumber": phoneNumber,
            "email": email,
            "passwordChangeDate": passwordChangeDate        ]
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
