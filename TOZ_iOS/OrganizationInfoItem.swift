//
//  OrganizationInfoItem.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

/**
 JSON objects parsed by *Mapper will be assigned to this Struct's properties
 */
struct OrganizationInfoItem: ParsedItem {

    let header: String
    let description: String
    let name: String
    let branch: String
    let addressStreet: String
    let addressHouseNumber: String
    let addressPostcode: String
    let addressCity: String
    let bankAccountNumber: String
    let bankAccountBankName: String
}
