//
//  ResponseMapper.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

protocol ResponseMapperProtocol {
    associatedtype Item
    static func process(_ obj: AnyObject?) throws -> Item
}

internal enum ResponseMapperError: Error {
    case invalid
    case responseParsingFailed
}

class ResponseMapper<A: ParsedItem> {

    static func process(_ obj: AnyObject?, parse: (_ json: [String: AnyObject]) throws -> A?) throws -> A {
        guard let json = obj as? [String: AnyObject] else { throw ResponseMapperError.invalid }
        if let item = try parse(json) {
            return item
        } else {
            throw ResponseMapperError.responseParsingFailed
        }
    }
}
