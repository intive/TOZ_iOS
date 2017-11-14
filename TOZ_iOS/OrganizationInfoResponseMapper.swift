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
    // swiftlint:disable cyclomatic_complexity
    static func process(_ obj: AnyObject?) throws -> OrganizationInfoItem {
    // swiftlint:enable cyclomatic_complexity
        return try process(obj, parse: { json in
            guard let name = json["name"] as? String else { return nil }
            guard let invitationText = json["invitationText"] as? String? else { return nil }
            guard let volunteerText = json["volunteerText"] as? String? else { return nil }
            guard let address = json["address"] as? [String: Any] else { return nil }
            guard let street = address["street"] as? String? else { return nil }
            guard let houseNumber = address["houseNumber"] as? String? else { return nil }
            guard let apartmentNumber = address["apartmentNumber"] as? String? else { return nil }
            var adressApartmentNumber: String? = nil
            if let apartmentNumber = apartmentNumber {
                adressApartmentNumber = "/" + apartmentNumber
            }
            guard let postcode = address["postCode"] as? String? else { return nil }
            guard let city = address["city"] as? String? else { return nil }
            guard let country = address["country"] as? String? else { return nil }
            guard let contact = json["contact"] as? [String: Any] else { return nil }
            guard let email = contact["email"] as? String? else { return nil }
            guard let phone = contact["phone"] as? String? else { return nil }
            guard let fax = contact["fax"] as? String? else { return nil }
            guard let website = contact["website"] as? String? else { return nil }
            guard let bankAccount = json["bankAccount"] as? [String: Any] else { return nil }
            guard let accountNumber = bankAccount["number"] as? String else { return nil }
            guard let bankName = bankAccount["bankName"] as? String? else { return nil }

            return OrganizationInfoItem(name: name, invitationText: invitationText, volunteerText: volunteerText, street: street, houseNumber: houseNumber, apartmentNumber: adressApartmentNumber, postCode: postcode, city: city, country: country, email: email, phone: phone, fax: fax, website: website, accountNumber: accountNumber, bankName: bankName)
        })
    }
}
