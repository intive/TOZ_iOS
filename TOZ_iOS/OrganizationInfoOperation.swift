//
//  OrganizationInfoOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class OrganizationInfoOperation: ServiceOperation {

    private let request: OrganizationInfoRequest = OrganizationInfoRequest()

    private(set) var result: RequestResult<OrganizationInfoItem>? = nil
    var resultCompletion: ((RequestResult<OrganizationInfoItem>) -> Void)? = nil

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success:
            do {
                let item = try OrganizationInfoResponseMapper.process(response as AnyObject)
                resultCompletion!(RequestResult<OrganizationInfoItem>.success(item))
            } catch {
                resultCompletion!(RequestResult<OrganizationInfoItem>.failure(RequestError.FailedToMapSerializedJSON))
            }
        default:
            resultCompletion!(RequestResult<OrganizationInfoItem>.failure(RequestError.OperationError))
        }
    }
}
