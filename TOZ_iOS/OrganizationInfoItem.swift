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
public struct OrganizationInfoItem: ParsedItem {

    public let name: String
    public let bankAccount: [String : Any]
    public let bankAccountNumber: String
    public let bankAccountBankName: String
}
