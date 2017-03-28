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
    func request(_ request: BackendAPIRequest, completion: @escaping (RequestResult<AnyObject>) -> Void) {

        /// Adds endpoint to backend URL
        let url = conf.baseURL.appendingPathComponent(request.endpoint)

        let headers = request.headers

        /// Uses NetworkService class to execute HTTP request
        service.makeRequest(for: url, method: request.method, params: request.parameters, headers: headers, success: { data in
            var json: AnyObject? = nil
            if let data = data {
                json = try? JSONSerialization.jsonObject(with: data as Data, options: []) as AnyObject
            }
            if let json = json {
                completion(RequestResult<AnyObject>.success(json))
            } else {
                completion(RequestResult<AnyObject>.failure(RequestError.FailedToSerializeJSON))
            }

        }, failure: { data, error, statusCode in
            if statusCode == 401 {
                /// Operation not authorized
                NotificationCenter.default.post(name: .didPerformUnauthorizedOperation, object: nil)
                return
            }

            /// Check if failure comes with "error" field as a response
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: Any] {
                    let errorField = json?["error"] as? String ?? ""
                    completion(RequestResult<AnyObject>.failure(RequestError.ServerRespondedWithErrorField(errorField)))
                }
            } else {
                completion(RequestResult<AnyObject>.failure(RequestError.BackendError))
            }
        })
    }

    func cancel() {
        service.cancel()
    }
}
