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
            let name = json["name"] as? String
            let bankAccount = json["bankAccount"] as? [String : Any]
            let bankAccountNumber = bankAccount?["number"] as? String
            let bankAccountBankName = bankAccount?["bankName"] as? String
            if let name = name, let bankAccount = bankAccount, let bankAccountNumber = bankAccountNumber, let bankAccountBankName = bankAccountBankName {
                return OrganizationInfoItem(name: name, bankAccount: bankAccount, bankAccountNumber: bankAccountNumber, bankAccountBankName: bankAccountBankName)
            }
            return nil
        })
    }
}
