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
            guard let jwt = json["jwt"] as? String else { return nil }
            guard let userId = json["userId"] as? String else { return nil }
            guard let email = json["email"] as? String else { return nil }
            guard let name = json["name"] as? String else { return nil }
            guard let surname = json["surname"] as? String else { return nil }

            return SignInItem(jwt: jwt, userId: userId, email: email, name: name, surname: surname)
        })
    }
}
