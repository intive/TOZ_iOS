//
//  ResetPasswordOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class ResetPasswordOperation: ServiceOperation {

    private let request: ResetPasswordRequest
    var resultCompletion: ((_ success: Bool) -> Void)?

    init(email: String) {
        request = ResetPasswordRequest(email: email)
        super.init()
    }

    func start(completion: ((_ success: Bool) -> Void)?) {
        self.resultCompletion = completion
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success:
            resultCompletion?(true)
            return
        case .failure:
            resultCompletion?(false)
        }
    }

}
