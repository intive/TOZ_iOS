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
    let invitationText: String?
    let volunteerText: String?
    let street: String?
    let houseNumber: String?
    let apartmentNumber: String?
    let postCode: String?
    let city: String?
    let country: String?
    let email: String?
    let phone: String?
    let fax: String?
    let website: String?
    let accountNumber: String
    let bankName: String?
}
