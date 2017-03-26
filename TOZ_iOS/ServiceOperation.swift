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

    let service: BackendService

    init() {
        self.service = BackendService(BackendConfiguration.shared)
    }

    func cancel() {
        service.cancel()
    }
}
