//
//  OrganizationInfoOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

public class OrganizationInfoOperation: ServiceOperation {

    private let request: OrganizationInfoRequest = OrganizationInfoRequest()

    public var success: ((OrganizationInfoItem) -> Void)?
    public var failure: ((NSError) -> Void)?

    public func start() {
        service.request(request, success: handleSuccess, failure: handleFailure)
    }

    private func handleSuccess(_ response: AnyObject?) {
        do {
            let item = try OrganizationInfoResponseMapper.process(response)
            self.success?(item)
        } catch {
            handleFailure(NSError.cannotParseResponse())
        }
    }

    private func handleFailure(_ error: NSError) {
        self.failure?(error)
    }
}
