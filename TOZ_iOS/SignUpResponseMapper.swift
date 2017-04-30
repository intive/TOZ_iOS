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
            guard let jwt = json["jwt"] as? String else { return nil }
            
            return SignUpItem(jwt: jwt)
        })
    }
}
