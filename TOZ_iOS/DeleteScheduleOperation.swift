//
//  DeleteScheduleOperation.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class DeleteScheduleOperation: ServiceOperation {
    private let request: DeleteScheduleRequest

    private(set) var result: RequestResult<[CalendarItem]>?
    var resultCompletion: ((RequestResult<[CalendarItem]>) -> Void)?

    public init(idObject: String, dataObject: CalendarItem) {
        self.request = DeleteScheduleRequest(idObject: idObject)
    }

    func start() {
        service.request(request, completion: handleResponse)
    }

    private func handleResponse(_ response: RequestResult<AnyObject>) {
        switch response {
        case .success(let object):
            do {
                callCompletion(.success(try CalendarResponseMapper.process(object)))
            } catch let error {
                callCompletion(.failure(error))
            }
        case .failure(let error):
            callCompletion(.failure(error))
        }
    }

    func callCompletion(_ result: RequestResult<[CalendarItem]>) {
        self.result = result
        resultCompletion?(result)
    }

}
