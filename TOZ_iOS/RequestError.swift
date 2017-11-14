//
//  RequestError.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case failedToSerializeJSON
    case invalidResponse
    case connectionError(Error)
    case invalidRequest
    case unexpectedNetworkError
    case serverRespondedWithErrorField(String)
}
