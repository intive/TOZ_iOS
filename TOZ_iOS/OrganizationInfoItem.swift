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

    let name: String
    let bankAccount: [String : Any]
    let bankAccountNumber: String
    let bankAccountBankName: String
}
