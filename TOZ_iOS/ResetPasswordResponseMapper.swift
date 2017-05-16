//
//  ResetPasswordResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ResetPasswordResponseMapper: ResponseMapper<ResetPasswordItem>, ResponseMapperProtocol {
    static func process(_ obj: AnyObject?) throws -> ResetPasswordItem {
        return try process(obj, parse: { json in
            guard let message = json["message"] as? String else { return nil }
            return ResetPasswordItem(message: message)
        })
    }

}
