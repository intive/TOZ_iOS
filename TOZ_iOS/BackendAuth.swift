//
//  BackendAuth.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let backendAuthStateChanged = Notification.Name("BackendAuthStateChanged")
}

final class BackendAuth {

    private let key = "BackendAuthToken"
    private let defaults: UserDefaults

    static let shared: BackendAuth = BackendAuth(defaults: UserDefaults.standard)

    init(defaults: UserDefaults) {
        self.defaults = defaults
    }

    var token: String? {
        return defaults.value(forKey: key) as? String
    }

    var userId: String? {
        return defaults.value(forKey: "userId") as? String
    }

    var name: String? {
        return defaults.value(forKey: "name") as? String
    }

    var surname: String? {
        return defaults.value(forKey: "surname") as? String
    }

    func setToken(_ token: String) {
        defaults.setValue(token, forKey: key)
        NotificationCenter.default.post(name: .backendAuthStateChanged, object: self)
    }

    func deleteToken() {
        if self.token != nil {
            defaults.removeObject(forKey: key)
            print("Token was revoked")
            defaults.removeObject(forKey: "userId")
            defaults.removeObject(forKey: "name")
            defaults.removeObject(forKey: "surname")
            NotificationCenter.default.post(name: .backendAuthStateChanged, object: self)
        }
    }

    func setUserId(_ userId: String) {
        defaults.setValue(userId, forKey: "userId")
    }
    func setName(_ name: String) {
        defaults.setValue(name, forKey: "name")
    }
    func setSurname(_ surname: String) {
        defaults.setValue(surname, forKey: "surname")
    }

}
