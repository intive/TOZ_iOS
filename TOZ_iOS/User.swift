//
//  User.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class User {
    static let shared: User = User()

    var isSignedIn: Bool {
        if BackendAuth.shared.token != nil {
            return true
        } else {
            return false
        }
    }
}
