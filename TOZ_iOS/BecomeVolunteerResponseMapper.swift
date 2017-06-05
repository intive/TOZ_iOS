//
//  BecomeVolunteerResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class BecomeVolunteerResponseMapper: ResponseMapper<BecomeVolunteerItem>, ResponseMapperProtocol {
    static func process(_ obj: AnyObject?) throws -> BecomeVolunteerItem {
        return try process(obj, parse: { json in
            guard let howToHelpDescription = json["howToHelpDescription"] as? String else { return nil }

            return BecomeVolunteerItem(howToHelpDescription: howToHelpDescription)
        })
    }
}
