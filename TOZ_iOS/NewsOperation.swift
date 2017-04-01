//
//  NewsOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class NewsOperation: ServiceOperation {
    
    private let request: NewsRequest = NewsRequest()
    
    private(set) var result: RequestResult<[NewsItem]>?
    var resultCompletion: ((RequestResult<[NewsItem]>) -> Void)?
    
    func start() {
        service.request(request, completion: handleResponse)
    }
    
    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try NewsResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }
    
    func callCompletion(_ result: RequestResult<[NewsItem]>) {
        self.result = result
        resultCompletion?(result)
    }
}
