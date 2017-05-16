//
//  ResetPasswordOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class ResetPasswordOperation: ServiceOperation {

    private let request: ResetPasswordRequest

    init(email: String) {
        request = ResetPasswordRequest(email: email)
        super.init()
    }

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success: return
        case .failure: print ("error")
        }
    }

}
