//
//  ChangePasswordResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ChangePasswordResponseMapper: ResponseMapper<ChangePasswordItem>, ResponseMapperProtocol {
    static func process(_ obj: AnyObject?) throws -> ChangePasswordItem {
        return try process(obj, parse: { json in
            guard let message = json["message"] as? String else { return nil }
            return ChangePasswordItem(message: message)
        })
    }
}
