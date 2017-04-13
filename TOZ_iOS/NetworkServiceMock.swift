//
//  NetworkServiceMock.swift
//  TOZ_iOS
//
//  Created by patronage on 09.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class NetworkServiceMock: NetworkService {
    override func makeRequest(for url: URL,
                              method: NetworkService.Method,
                              params: [String : Any]?,
                              headers: [String : String]?,
                              success: ((Data?) -> Void)?,
                              failure: ((Data?, RequestError, Int) -> Void)?) {
        var jsonObj: NSData?
        // News request
        if url.absoluteString == "http://dev.patronage2017.intive-projects.com/news?shortened=false" ||
            url.absoluteString == "http://dev.patronage2017.intive-projects.com/news?shortened=true" {
            switch method {
            case .GET:
                let path = Bundle.main.path(forResource: "GetNews", ofType: "json")
                if let path = path {
                    jsonObj = try? NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                }
                break
            default:
                failure?(nil, RequestError.InvalidRequest, 0)
            } // organization info request
        } else if url.absoluteString == "http://dev.patronage2017.intive-projects.com/organization/info" {
            switch method {
            case .GET:
                let path = Bundle.main.path(forResource: "GetOrganizationInfo", ofType: "json")
                if let path = path {
                    jsonObj = try? NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                }
                break
            default:
                failure?(nil, RequestError.InvalidRequest, 0)
            } // animal list request
        } else if url.absoluteString == "http://dev.patronage2017.intive-projects.com/pets" {
            switch method {
            case .GET:
                let path = Bundle.main.path(forResource: "GetAnimals", ofType: "json")
                if let path = path {
                jsonObj = try? NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                }
                break
            default:
                failure?(nil, RequestError.InvalidRequest, 0)
            }
        }
        var mutableRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
        mutableRequest.allHTTPHeaderFields = headers
        mutableRequest.httpMethod = method.rawValue
        if let jsonObj = jsonObj {
            do {
                mutableRequest.httpBody = try JSONSerialization.data(withJSONObject: jsonObj, options: [])
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
}
