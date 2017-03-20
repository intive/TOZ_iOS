//
//  NSError+Failure.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

extension NSError {
    class func cannotParseResponse() -> NSError {
        let info = [NSLocalizedDescriptionKey: "Can't parse response. Please report a bug."]
        return NSError(domain: String(describing: self), code: 0, userInfo: info)
    }
}
