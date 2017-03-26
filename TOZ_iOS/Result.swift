//
//  Result.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(RequestError)
}
