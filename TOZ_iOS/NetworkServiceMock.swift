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
                              params: [String: Any]?,
                              headers: [String: String]?,
                              success: ((Data?) -> Void)?,
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
                case .POST:
                    nameOfFile = "AddSchedule"
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
            } else if url.path == "/pets/c5296892-347f-4b2e-b1c6-6faff971f767" {
                switch method {
                case .GET:
                    nameOfFile = "GetDogByID"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/pets/onephotodog-347f-4b2e-b1c6-6faff971f767" {
                switch method {
                case .GET:
                    nameOfFile = "GetDogByIDOnePhoto"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/pets/nophotodog-347f-4b2e-b1c6-6faff971f767" {
                switch method {
                case .GET:
                    nameOfFile = "GetDogByIDNoPhoto"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/pets/3d45a1dd-2b49-4c4a-96cb-ccbed96cae2d" {
                switch method {
                case .GET:
                    nameOfFile = "GetCatById"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/pets/nophotocat-2b49-4c4a-96cb-ccbed96cae2d" {
                switch method {
                case .GET:
                    nameOfFile = "GetCatByIDNoPhoto"
                default:
                    print("Method is not appropriate.")
                }
            } else if url.path == "/organization/becomevolunteer" {
                switch method {
                case .GET:
                    nameOfFile = "getBecomeVolunteer"
                default:
                    print("Method is not appropriate.")
                }
            }
            guard let path = Bundle.main.path(forResource: nameOfFile, ofType: "json") else {
                failure?(nil, RequestError.invalidRequest, 0)
                return
            }
            guard let jsonObj = try? NSData(contentsOfFile: path, options: []) else {
                failure?(nil, RequestError.invalidRequest, 0)
                return
            }
            success?(jsonObj as Data)
        }
    }
}
