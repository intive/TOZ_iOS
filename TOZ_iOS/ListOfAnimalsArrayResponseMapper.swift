//
//  ListOfAnimalsArrayResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ListOfAnimalsArrayMapper: ArrayResponseMapper<ListOfAnimalsItem>, ResponseMapperProtocol {

    static func process(_ obj: AnyObject?) throws -> [ListOfAnimalsItem] {
        return try process(obj, mapper: { jsonNode in
            guard let animalID = jsonNode["id"] as? String else { throw ResponseMapperError.responseParsingFailed }
            guard let name = jsonNode["name"] as? String else { throw ResponseMapperError.responseParsingFailed }
            guard let type = jsonNode["type"] as? String else { throw ResponseMapperError.responseParsingFailed }
            guard let sex = jsonNode["sex"] as? String else { throw ResponseMapperError.responseParsingFailed }
            guard let description = jsonNode["description"] as? String? else { throw ResponseMapperError.responseParsingFailed }
            guard let address = jsonNode["address"] as? String? else { throw ResponseMapperError.responseParsingFailed }
            guard let created = jsonNode["created"] as? Int? else { throw ResponseMapperError.responseParsingFailed }
            guard let lastModified = jsonNode["lastModified"] as? Int? else { throw ResponseMapperError.responseParsingFailed }
            guard let imageUrl = jsonNode["imageUrl"] as? String? else { throw ResponseMapperError.responseParsingFailed }
            return ListOfAnimalsItem(animalID: animalID, name: name, type: type, sex: sex, description: description, address: address, created: created, lastModified: lastModified, imageUrl: imageUrl)
        })
    }
}
