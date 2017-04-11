//
//  AnimalResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

/**
 Parses response from OrganizationInfo operation. Inherits from generic ResponseMapper class.
 */
final class AnimalResponseMapper: ResponseMapper<AnimalItem>, ResponseMapperProtocol {

    static func process(_ obj: AnyObject?) throws -> AnimalItem {
        return try process(obj, parse: { json in
            guard let animalID = json["id"] as? String else { return nil }
            guard let name = json["name"] as? String else { return nil }
            guard let type = json["type"] as? String else { return nil }
            guard let sex = json["sex"] as? String else { return nil }
            guard let description = json["description"] as? String? else { return nil }
            guard let address = json["address"] as? String? else { return nil }
            guard let createdInt = json["created"] as? Int? else { return nil }
            var createdDate: Date? = nil
            if let createdInt = createdInt {
                createdDate = Date(timeIntervalSince1970: TimeInterval(createdInt))
            }
            guard let lastModified = json["lastModified"] as? Int? else { return nil }
            guard let imageUrl = json["imageUrl"] as? String? else { return nil }
            return AnimalItem(animalID: animalID, name: name, type: type, sex: sex, description: description, address: address, created: createdDate, lastModified: lastModified, imageUrl: imageUrl)
        })
    }
}
