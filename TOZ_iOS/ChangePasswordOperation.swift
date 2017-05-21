//
//  ChangePasswordOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class ChangePasswordOperation: ServiceOperation {

    private let request: ChangePasswordRequest

    init(oldPassword: String, newPassword: String) {
        request = ChangePasswordRequest(oldPassword: oldPassword, newPassword: newPassword)
        super.init()
    }

    private(set) var result: RequestResult<ChangePasswordItem>?
    var resultCompletion: ((RequestResult<ChangePasswordItem>) -> Void)?

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try ChangePasswordResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<ChangePasswordItem>) {
        self.result = result
        resultCompletion?(result)
    }
}
