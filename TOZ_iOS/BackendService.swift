//
//  BackendService.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let didPerformUnauthorizedOperation = Notification.Name("DidPerformUnauthorizedOperation")
}

/**
Class that takes requests (*Request objects) related to the backend.
Tries to serialize the response data to json.
*/
class BackendService {

    private let conf: BackendConfiguration
    private let service = NetworkService() // commented in order to run NetworkServiceMock
//    private let service = NetworkServiceMock() // test of NetworkService
    init(_ conf: BackendConfiguration) {
        self.conf = conf
    }

    /// Takes BackendAPIRequest as parameter and extracts necessary informations from the request object
    func request(_ request: BackendAPIRequest, completion: @escaping (RequestResult<AnyObject>) -> Void) {

        /// Adds endpoint to backend URL
        let url = conf.baseURL.appendingPathComponent(request.endpoint)

        let headers = request.headers

        /// Uses NetworkService class to execute HTTP request
        service.makeRequest(for: url, method: request.method, params: request.parameters, headers: headers, success: { data in
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject {
                completion(.success(json))
            } else {
                completion(.failure(RequestError.FailedToSerializeJSON))
            }

        }, failure: { data, error, statusCode in
            guard statusCode != 401 else {
                /// Operation not authorized
                NotificationCenter.default.post(name: .didPerformUnauthorizedOperation, object: nil)
                return
            }

            /// Check if failure comes with "error" field as a response
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let errorField = json?["error"] as? String ?? ""
                completion(.failure(RequestError.ServerRespondedWithErrorField(errorField)))
            } else {
                completion(.failure(error))
            }
        })
    }

    func cancel() {
        service.cancel()
    }
}
