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

            return SignInItem(jwt: jwt)
        })
    }
}
