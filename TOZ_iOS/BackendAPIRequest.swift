//
//  BackendAPIRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

/**
 Classes implementing this protocol are able to provide informations required
 to build a request.
 */
protocol BackendAPIRequest {
    var endpoint: String { get }
    var method: NetworkService.Method { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension BackendAPIRequest {

    /// Returns default headers for JSON content
    func defaultJSONHeaders() -> [String: String] {
        return ["Accept": "application/json"]
    }
    /// Returns when JSON is sent
    func headersWhenJSONSent() -> [String: String] {
        return ["Accept": "application/json", "Content-Type": "application/json"]
    }
}
