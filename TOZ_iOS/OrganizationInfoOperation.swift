//
//  OrganizationInfoOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class OrganizationInfoOperation: ServiceOperation {

    private let request: OrganizationInfoRequest = OrganizationInfoRequest()

//    public var success: ((OrganizationInfoItem) -> Void)?
//    public var failure: ((Error) -> Void)?
    
//    enum OperationResult {
//        case success(OrganizationInfoItem)
//        case failure(Error)
//    }
    
    var result: Result<OrganizationInfoItem>? = nil

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: Result<AnyObject>) {
        switch response {
        case .success:
            do {
                let item = try OrganizationInfoResponseMapper.process(response as AnyObject?)
                result = .success(item)
            } catch {
                result = .failure(RequestError.FailedToSerializeJSON)
            }
        case .failure:
                result = .failure(RequestError.OperationError)
        }
    }
//
//    private func handleSuccess(_ response: AnyObject?) {
//        do {
//            let item = try OrganizationInfoResponseMapper.process(response)
//            self.success?(item)
//        } catch {
//            handleFailure(OperationError.cannotParseResponse)
//        }
//    }
//
//    private func handleFailure(_ error: Error) {
//        self.failure?(error)
//    }
}
