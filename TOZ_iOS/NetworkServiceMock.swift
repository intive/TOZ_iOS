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
                              failure: ((_ data: Data?, _ error: RequestError, _ responseCode: Int) -> Void)? = nil) {
        var jsonObj: NSData?
        var path: String?
        // News request
        if url.absoluteString == url.path {
            switch method {
            case .GET:
                path = Bundle.main.path(forResource: "GetNews", ofType: "json")
                break
            default:
                failure?(nil, RequestError.InvalidRequest, 0)
            } // organization info request
        } else if url.absoluteString == url.path {
            switch method {
            case .GET:
                path = Bundle.main.path(forResource: "GetOrganizationInfo", ofType: "json")
                break
            default:
                failure?(nil, RequestError.InvalidRequest, 0)
            } // animal list request
        } else if url.absoluteString == url.path {
            switch method {
            case .GET:
                path = Bundle.main.path(forResource: "GetAnimals", ofType: "json")
                break
            default:
                failure?(nil, RequestError.InvalidRequest, 0)
            }
        }
        if let path = path {
            jsonObj = try? NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
        }
    }
}
