//
//  SignUpRequest.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class SignUpRequest: BackendAPIRequest {
    
    private let email: String
    private let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    var endpoint: String {
        return "/tokens/acquire"
    }
    
    var method: NetworkService.Method {
        return .POST
    }
    
    var parameters: [String: Any]? {
        return [
            "email": email,
            "password": password
        ]
    }
    
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
