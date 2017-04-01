//
//  ArrayResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class ArrayResponseMapper<A: ParsedItem> {

    static func process(_ obj: AnyObject?, mapper: ((AnyObject) throws -> A?)) throws -> [A] {
        guard let json = obj as? [[String: AnyObject]] else { throw ResponseMapperError.invalid }
        
        var items = [A]()
        for jsonNode in json {
            let item = try mapper(jsonNode as AnyObject)
            if let item = item {
                items.append(item)
            }
        }
        return items
    }
}
