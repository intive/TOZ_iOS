//
//  ServiceOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

public class ServiceOperation {

    let service: BackendService

    public init() {
        self.service = BackendService(BackendConfiguration.shared)
    }

    public func cancel() {
        service.cancel()
    }
}
