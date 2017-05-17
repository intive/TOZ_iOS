//
//  NetworkServiceMock.swift
//  TOZ_iOS
//
//  Created by patronage on 09.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class NetworkServiceMock: NetworkService {
    // swiftlint:disable cyclomatic_complexity function_body_length
    override func makeRequest(for url: URL,
                              method: NetworkService.Method,
                              params: [String : Any]?,
                              headers: [String : String]?,
                              success: ((Data?) -> Void)?,
                              // swiftlint:disable large_tuple
                              failure: ((_ data: Data?, _ error: RequestError, _ responseCode: Int) -> Void)? = nil) {
        DispatchQueue.global().async {
            var nameOfFile: String?
            // News request
            if url.path == "/news" {
                switch method {
                case .GET:
                    nameOfFile = "GetNews"
                default:
                    print("Method is not appropriate.")
                } // organization info request
            } else if url.path == "/organization/info" {
                switch method {
                case .GET:
                    nameOfFile = "GetOrganizationInfo"
                default:
                    print("Method is not appropriate.")
                } // animal list request
            } else if url.path == "/pets" {
                switch method {
                case .GET:
                    nameOfFile = "GetAnimals"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/schedule" {
                switch method {
                case .GET:
                    nameOfFile = "GetSchedule"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/tokens/acquire" {
                switch method {
                case .POST:
                    nameOfFile = "PostLogin"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/users/passwords" {
                switch method {
                case .POST:
                    nameOfFile = "PostChangePassword"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/users" {
                switch method {
                case .POST:
                    nameOfFile = "PostRegistration"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/schedule" {
                switch method {
                case .POST:
                    nameOfFile = "AddSchedule"
                    break
                default:
                    print("Method is not appropriate.")
                }
            }
            guard let path = Bundle.main.path(forResource: nameOfFile, ofType: "json") else {
                failure?(nil, RequestError.InvalidRequest, 0)
                return
            }
            guard let jsonObj = try? NSData(contentsOfFile: path, options: []) else {
                failure?(nil, RequestError.InvalidRequest, 0)
                return
            }
            success?(jsonObj as Data)
        }
    }
}
