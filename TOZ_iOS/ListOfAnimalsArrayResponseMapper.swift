//
//  ListOfAnimalsArrayResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ListOfAnimalsArrayMapper: ArrayResponseMapper<ListOfAnimalsItem>, ResponseMapperProtocol {

    static func process(_ obj: AnyObject?) throws -> [ListOfAnimalsItem?] {
        return try process(obj, mapper: { jsonNode in
            guard let animalID = jsonNode?["id"] as? String? else { return nil }
            guard let name = jsonNode?["name"] as? String else { return nil }
            guard let type = jsonNode?["id"] as? String else { return nil }
            guard let sex = jsonNode?["sex"] as? String else { return nil }
            guard let description = jsonNode?["description"] as? String? else { return nil }
            guard let address = jsonNode?["address"] as? String? else { return nil }
            guard let created = jsonNode?["created"] as? Int? else { return nil }
            guard let lastModified = jsonNode?["lastModified"] as? Int? else { return nil }
            guard let imageUrl = jsonNode?["imageUrl"] as? String? else { return nil }
            return ListOfAnimalsItem(animalID: animalID, name: name, type: type, sex: sex, description: description, address: address, created: created, lastModified: lastModified, imageUrl: imageUrl)
        })
    }
}
