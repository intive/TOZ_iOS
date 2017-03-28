//
//  Result.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum RequestResult<T> {
    case success(T)
    case failure(Error)
}
