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
public class ServiceOperation {

    let service: BackendService

    public init() {
        self.service = BackendService(BackendConfiguration.shared)
    }

    public func cancel() {
        service.cancel()
    }
}
