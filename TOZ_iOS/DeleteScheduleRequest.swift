//
//  UpdateScheduleRequest.swift
//  TOZ_iOS
//
//  Created by RKB on 13/04/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class DeleteScheduleRequest: BackendAPIRequest {

    private let idObject: String

    init(idObject: String) {
        self.idObject = idObject
    }

    var endpoint: String {
        return "/schedule/\(idObject)"
    }
    var method: NetworkService.Method {
        return .DELETE
    }
    var parameters: [String: Any]? {
        return nil
    }
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }

}
