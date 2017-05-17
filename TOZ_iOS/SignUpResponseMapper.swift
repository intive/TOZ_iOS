//
//  SignUpResponseMapper.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class SignUpResponseMapper: ResponseMapper<SignUpItem>, ResponseMapperProtocol {
    static func process(_ obj: AnyObject?) throws -> SignUpItem {
        return try process(obj, parse: { json in
            guard let userID = json["id"] as? String else { return nil }
            guard let password = json["password"] as? String else { return nil }
            guard let roles = json["roles"] as? [Role]? else { return nil }
            guard let name = json["name"] as? String else { return nil }
            guard let surname = json["surname"] as? String else { return nil }
            guard let phoneNumber = json["phoneNumber"] as? String else { return nil }
            guard let email = json["email"] as? String else { return nil }
            guard let passwordChangeDate = json["passwordChangeDate"] as? Int? else { return nil }
            return SignUpItem(userID: userID, password: password, roles: roles, name: name, surname: surname, phoneNumber: phoneNumber, email: email, passwordChangeDate: passwordChangeDate)
        })
    }
}
