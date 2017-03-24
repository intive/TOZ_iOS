//
//  OrganizationInfoOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

public class OrganizationInfoOperation: ServiceOperation {

    private let request: OrganizationInfoRequest = OrganizationInfoRequest()

    private enum Errors: Error {
        case cannotParseResponse
    }
    
    enum Result {
        case success(((OrganizationInfoItem) -> Void)?)
        case failure(((Error) -> Void)?)
    }
    
    public var success: ((OrganizationInfoItem) -> Void)?
    public var failure: ((Error) -> Void)?

    public func start() {
        service.request(request, success: handleSuccess, failure: handleFailure)
    }

    private func handleSuccess(_ response: AnyObject?) {
        do {
            let item = try OrganizationInfoResponseMapper.process(response)
            self.success?(item)
        } catch {
            handleFailure(Errors.cannotParseResponse)
        }
    }

    private func handleFailure(_ error: Error) {
        self.failure?(error)
    }
}
