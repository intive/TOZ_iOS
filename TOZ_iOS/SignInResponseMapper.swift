//
//  SignInResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class SignInResponseMapper: ResponseMapper<SignInItem>, ResponseMapperProtocol {
    static func process(_ obj: AnyObject?) throws -> SignInItem {
        return try process(obj, parse: { json in
            guard let email = json["email"] as? String else { return nil }
            guard let password = json["password"] as? String else { return nil }
            guard let userID = json["id"] as? String? else { return nil }
            guard let forename = json["forename"] as? String else { return nil }
            guard let surname = json["surname"] as? String else { return nil }
            guard let role = json["role"] as? String else { return nil }

            return SignInItem(email: email, password: password, userID: userID, forename: forename, surname: surname, role: role)
        })
    }
}
