//
//  NetworkService.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

/**
 Allows to execute HTTP request.
 Every network service can execute just one request at a time, can cancel the request.
 Has callbacks for success and failure responses.
*/
class NetworkService {

    private var task: URLSessionDataTask?
    private var successCodes: CountableRange<Int> = 200..<299
    private var failureCodes: CountableRange<Int> = 400..<499

    /// enum for choosing HTTP request method
    enum Method: String {
        case GET, POST, PUT, DELETE
    }

    func makeRequest(for url: URL, method: Method,
                     params: [String: Any]? = nil,
                     headers: [String: String]? = nil,
                     success: ((Data?) -> Void)? = nil,
                     // swiftlint:disable large_tuple
                     failure: ((_ data: Data?, _ error: RequestError, _ responseCode: Int) -> Void)? = nil) {

        /// Details about request
        /// Encapsulates metadata related to a URL request, including the URL, HTTP request method, HTTP headers fields
        var mutableRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                        timeoutInterval: 10.0)
        mutableRequest.allHTTPHeaderFields = headers
        mutableRequest.httpMethod = method.rawValue

        /// HTTP body data
        if let params = params {
            do {
                mutableRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                print("Serialization parameters to JSON failed")
                failure?(nil, RequestError.FailedToSerializeJSON, 0)
                return
            }
        }
        /// Creates a session with default configuration
        let session = URLSession.shared

        /// Creates task object within the session. Returns data as an Data object
        task = session.dataTask(with: mutableRequest as URLRequest, completionHandler: { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                failure?(data, RequestError.InvalidResponse, 0)
                return
            }

            if let error = error {
                // Request failed, might be internet connection issue
                failure?(data, RequestError.ConnectionError(error), httpResponse.statusCode)
                return
            }

            if self.successCodes.contains(httpResponse.statusCode) {
                print("Request finished with success.")
                success?(data)
            } else if self.failureCodes.contains(httpResponse.statusCode) {
                print("Request finished with failure.")
                failure?(data, RequestError.InvalidRequest, httpResponse.statusCode)
            } else {
                // Server returned response with status code different than
                // expected `successCodes`
                print("Request finished with serious failure.")
                print("Request failed with code \(httpResponse.statusCode)")
                print("Wrong handling logic, wrong endpoint mapping or backend bug.")
                failure?(data, RequestError.UnexpectedNetworkError, httpResponse.statusCode)
            }
        })
        task?.resume()
    }

    func cancel() {
        task?.cancel()
    }
}
