//
//  ListOfAnimalsOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class ListOfAnimalsOperation: ServiceOperation {

    private let request: ListOfAnimalsRequest = ListOfAnimalsRequest()

    private(set) var result: RequestResult<[AnimalItem]>?
    var resultCompletion: ((RequestResult<[AnimalItem]>) -> Void)?

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try ListOfAnimalsArrayMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<[AnimalItem]>) {
        self.result = result
        resultCompletion?(result)
    }
}
