//
//  OrganizationInfoOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class OrganizationInfoOperation: ServiceOperation {

    private let request: OrganizationInfoRequest = OrganizationInfoRequest()

    var result: Result<OrganizationInfoItem>? = nil
    var resultCompletion: ((Result<OrganizationInfoItem>) -> Void)? = nil

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: Result<AnyObject>) {
        switch response {
        case .success:
            do {
                let item = try OrganizationInfoResponseMapper.process(response as AnyObject?)
                result = .success(item)
                resultCompletion!(result!)
            } catch {
                result = .failure(RequestError.FailedToSerializeJSON)
                resultCompletion!(result!)
            }
        default:
                result = .failure(RequestError.OperationError)
                resultCompletion!(result!)
        }
    }    
}
