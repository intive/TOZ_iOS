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
            guard let header = json["header"] as? String else { return nil }
            guard let description = json["description"] as? String else { return nil }
            guard let name = json["name"] as? String else { return nil }
            guard let branch = json["branch"] as? String else { return nil }
            guard let address = json["address"] as? [String : Any] else { return nil }
            guard let addressStreet = address["street"] as? String else { return nil }
            guard let addressHouseNumber = address["houseNumber"] as? String else { return nil }
            guard let addressPostcode = address["postCode"] as? String else { return nil }
            guard let addressCity = address["city"] as? String else { return nil }
            guard let bankAccount = json["bankAccount"] as? [String : Any] else { return nil }
            guard let bankAccountNumber = bankAccount["number"] as? String else { return nil }
            guard let bankAccountBankName = bankAccount["bankName"] as? String else { return nil }
            return OrganizationInfoItem(header:header, description:description, name:name, branch:branch, addressStreet:addressStreet, addressHouseNumber:addressHouseNumber, addressPostcode:addressPostcode, addressCity:addressCity, bankAccountNumber: bankAccountNumber, bankAccountBankName: bankAccountBankName)
        })
    }
}
