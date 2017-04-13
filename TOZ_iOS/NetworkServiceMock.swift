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
        DispatchQueue.global().async {
            var jsonObj: NSData?
            var nameOfFile: String?
            // News request
            if url.path == "news?shortened=true" || url.path == "news?shortened=false" {
                switch method {
                case .GET:
                    nameOfFile = "GetNews"
                    break
                default:
                    print("Method is not appropriate.")
                } // organization info request
            } else if url.path == "info" {
                switch method {
                case .GET:
                    nameOfFile = "GetOrganizationInfo"
                    break
                default:
                    print("Method is not appropriate.")
                } // animal list request
            } else if url.path == "pets" {
                switch method {
                case .GET:
                    nameOfFile = "GetAnimals"
                    break
                default:
                    print("Method is not appropriate.")
                }
            }
            if let nameOfFile = nameOfFile {
                let path = Bundle.main.path(forResource: nameOfFile, ofType: "json")
                if let path = path {
                    jsonObj = try? NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                    if let jsonObj = jsonObj {
                        success?(jsonObj as Data)
                    }
                } else {
                    failure?(jsonObj as Data?, RequestError.InvalidRequest, 0)
                }
            } else {
                failure?(nil, RequestError.InvalidRequest, 0)
            }
        }
    }
}
