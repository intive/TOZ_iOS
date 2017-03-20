//
//  OrganizationInfoResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class OrganizationInfoResponseMapper: ResponseMapper<OrganizationInfoItem>, ResponseMapperProtocol {

    static func process(_ obj: AnyObject?) throws -> OrganizationInfoItem {
        return try process(obj, parse: { json in
            let name = json["name"] as? String
            let accountNumber = json["height"] as? String
            if let name = name, let accountNumber = accountNumber {
                return OrganizationInfoItem(name: name, accountNumber: accountNumber)
            }
            return nil
        })
    }
}
