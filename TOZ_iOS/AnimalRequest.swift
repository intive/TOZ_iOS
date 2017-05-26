//
//  AnimalRequest.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class AnimalRequest: BackendAPIRequest {

    private let animalID: String

    init(animalID: String) {
        self.animalID = animalID
    }

    var endpoint: String {
        return "/pets/\(animalID)"
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

    var queryItems: [URLQueryItem]?
}
