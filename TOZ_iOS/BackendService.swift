//
//  BackendService.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

let didPerformUnauthorizedOperation = "DidPerformUnauthorizedOperation"

/**
Class that takes requests (*Request objects) related to the backend.
Tries to serialize the response data to json.
*/
class BackendService {

    private let conf: BackendConfiguration
    private let service = NetworkService()

    init(_ conf: BackendConfiguration) {
        self.conf = conf
    }

    /// Takes BackendAPIRequest as parameter and extracts necessary informations from the request object
    func request(_ request: BackendAPIRequest,
                 /*success: ((AnyObject?) -> Void)? = nil,
                 failure: ((Error) -> Void)? = nil)*/
        completion: @escaping (Result<AnyObject>) -> Void) {

        /// Adds endpoint to backend URL
        let url = conf.baseURL.appendingPathComponent(request.endpoint)

        let headers = request.headers

        /// Uses NetworkService class to execute HTTP request
        service.makeRequest(for: url, method: request.method, params: request.parameters, headers: headers, success: { data in
            var json: AnyObject? = nil
            if let data = data {
                json = try? JSONSerialization.jsonObject(with: data as Data, options: []) as AnyObject
            }
            completion(.success(json))
            
        }, failure: { data, error, statusCode in
            if statusCode == 401 {
                // Operation not authorized
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: didPerformUnauthorizedOperation), object: nil)
                return
            }

            /// Checks if error response contains "error" field
            if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data as Data, options: []) as AnyObject
                completion(.failure(RequestError.ServerRespondedWithErrorField(json?["error"] as? String ?? "")))
            } else {
                completion(.failure(RequestError.BackendError))
            }
        })
    }

    func cancel() {
        service.cancel()
    }
}
