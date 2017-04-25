//
//  User.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class User {
    private(set) var isSignedIn: Bool

    static var shared: User = User(token: BackendAuth.shared.token)

    init(token: String?) {
        if token != nil {
            self.isSignedIn = true
        } else {
            self.isSignedIn = false
        }
    }
}
