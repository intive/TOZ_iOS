//
//  BackendAuth.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class BackendAuth {

    let key = "BackendAuthToken"
    let defaults: UserDefaults

    static var shared: BackendAuth = BackendAuth(defaults: UserDefaults.standard)

    init(defaults: UserDefaults) {
        self.defaults = defaults
    }

    var token: String? {
        return defaults.value(forKey: key) as? String
    }

    func setToken(_ token: String) {
        defaults.setValue(token, forKey: key)
    }

    func deleteToken() {
        defaults.removeObject(forKey: key)
    }
}
