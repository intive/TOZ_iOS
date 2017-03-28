//
//  OrganizationInfoResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

/**
 Parses response from OrganizationInfo operation. Inherits from generic ResponseMapper class.
 */
final class OrganizationInfoResponseMapper: ResponseMapper<OrganizationInfoItem>, ResponseMapperProtocol {

    static func process(_ obj: AnyObject?) throws -> OrganizationInfoItem {
        return try process(obj, parse: { json in
            guard let name = json["name"] as? String else { return nil }
            guard let bankAccount = json["bankAccount"] as? [String : Any] else { return nil }
            guard let bankAccountNumber = bankAccount["number"] as? String else { return nil }
            guard let bankAccountBankName = bankAccount["bankName"] as? String else { return nil }
            return OrganizationInfoItem(name: name, bankAccountNumber: bankAccountNumber, bankAccountBankName: bankAccountBankName)
        })
    }
}
