//
//  ListOfAnimalsRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class ListOfAnimalsRequest: BackendAPIRequest {

    var endpoint: String {
        return "/pets"
    }

    var method: NetworkService.Method {
        return .GET
    }

    var parameters: [String: Any]? {
        return nil
    }

    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
