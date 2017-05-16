//
//  ResetPasswordOperation.swift
//  TOZ_iOS
//
//  Created by Rafal Gorczynski on 15/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class ResetPasswordOperation: ServiceOperation {

    private let request: ResetPasswordRequest

    init(email: String, login: String, reset: Bool) {
        request = ResetPasswordRequest(email: email, login: login)
        super.init()
    }

    private(set) var result: RequestResult<ResetPasswordItem>?
    var resultCompletion: ((RequestResult<ResetPasswordItem>) -> Void)?

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try ResetPasswordResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<ResetPasswordItem>) {
        self.result = result
        resultCompletion?(result)
    }

}
