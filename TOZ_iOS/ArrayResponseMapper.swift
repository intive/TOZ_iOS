//
//  ArrayResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ArrayResponseMapper<A: ParsedItem> {

    static func process(_ obj: AnyObject?, mapper: ((Any?) throws -> A)) throws -> [A] {
        guard let json = obj as? [[String: AnyObject]] else { throw ResponseMapperError.invalid }

        var items = [A]()
        for jsonNode in json {
            let item = try mapper(jsonNode)
            items.append(item)
        }
        return items
    }
}
