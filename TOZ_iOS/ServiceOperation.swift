//
//  ServiceOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

/**
Class creates BackendService instance internally so it doesn’t need to be created in its every subclass.
 */
class ServiceOperation {

    var service: BackendService

    init(_ service: BackendService = BackendService(BackendConfiguration.shared)) {
        self.service = service
    }

    func cancel() {
        service.cancel()
    }
}
