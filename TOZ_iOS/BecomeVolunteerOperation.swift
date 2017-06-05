//
//  BecomeVolunteerOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class BecomeVolunteerOperation: ServiceOperation {

    private let request: BecomeVolunteerRequest = BecomeVolunteerRequest()

    private(set) var result: RequestResult<BecomeVolunteerItem>?
    var resultCompletion: ((RequestResult<BecomeVolunteerItem>) -> Void)?

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try BecomeVolunteerResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<BecomeVolunteerItem>) {
        self.result = result
        resultCompletion?(result)
    }
}
