//
//  ListOfAnimalsArrayResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ListOfAnimalsArrayMapper: ArrayResponseMapper<AnimalItem>, ResponseMapperProtocol {
    // swiftlint:disable cyclomatic_complexity
    static func process(_ obj: AnyObject?) throws -> [AnimalItem] {
        return try process(obj, mapper: { jsonNode in
            guard let animalID = jsonNode["id"] as? String else { throw ResponseMapperError.responseParsingFailed }
            guard let name = jsonNode["name"] as? String else { throw ResponseMapperError.responseParsingFailed }
            guard let type = jsonNode["type"] as? String else { throw ResponseMapperError.responseParsingFailed }
            guard let sex = jsonNode["sex"] as? String else { throw ResponseMapperError.responseParsingFailed }
            guard let description = jsonNode["description"] as? String? else { throw ResponseMapperError.responseParsingFailed }
            guard let address = jsonNode["address"] as? String? else { throw ResponseMapperError.responseParsingFailed }
            guard let createdInt = jsonNode["created"] as? Int? else { throw ResponseMapperError.responseParsingFailed }
            var createdDate: Date? = nil
            if let createdInt = createdInt {
                createdDate = Date(timeIntervalSince1970: TimeInterval(createdInt/1000))
            }
            guard let lastModified = jsonNode["lastModified"] as? Int? else { throw ResponseMapperError.responseParsingFailed }
            var lastModifiedDate: Date? = nil
            if let lastModified = lastModified {
                lastModifiedDate = Date(timeIntervalSince1970: TimeInterval(lastModified/1000))
            }
            guard let imageString = jsonNode["imageUrl"] as? String? else { throw ResponseMapperError.responseParsingFailed }
            var imageURL: URL? = nil
            if let imageString = imageString {
                imageURL = BackendConfiguration.shared.photosURL.appendingPathComponent(imageString)
            }
            return AnimalItem(animalID: animalID, name: name, type: type, sex: sex, description: description, address: address, created: createdDate, lastModified: lastModifiedDate, imageUrl: imageURL)
        })
    }
}
