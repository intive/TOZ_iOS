//
//  RequestError.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum RequestError: Error {
    case FailedToSerializeJSON
    case InvalidResponse
    case ConnectionError(NSError)
    case InvalidRequest(NSError?)
    case UnknownError
    case NoDataError
    case UnauthorizedRequest
    case ServerRespondedWithErrorField(String)
    case BackendError
    case OperationError
}
