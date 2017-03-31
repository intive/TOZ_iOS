//
//  OrganizationInfoOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class OrganizationInfoOperation: ServiceOperation {

    private let request: OrganizationInfoRequest = OrganizationInfoRequest()

    private(set) var result: RequestResult<OrganizationInfoItem>?
    var resultCompletion: ((RequestResult<OrganizationInfoItem>) -> Void)?

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try OrganizationInfoResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<OrganizationInfoItem>) {
        self.result = result
        resultCompletion?(result)
    }
}
