//
//  SignUpOperation.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class SignUpOperation: ServiceOperation {

    private let request: SignUpRequest
    var resultCompletion: ((_ success: Bool) -> Void)?

    init(name: String, surname: String, phoneNumber: String, email: String, roles: [Role.RawValue]) {
        request = SignUpRequest(name: name, surname: surname, phoneNumber: phoneNumber, email: email, roles: roles)
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
