//
//  SignInOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class SignInOperation: ServiceOperation {

    private let request: SignInRequest

    init(email: String, password: String) {
        request = SignInRequest(email: email, password: password)
        super.init()
    }

    private(set) var result: RequestResult<SignInItem>?
    var resultCompletion: ((RequestResult<SignInItem>) -> Void)?

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try SignInResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<SignInItem>) {
        self.result = result
        resultCompletion?(result)
    }
}
