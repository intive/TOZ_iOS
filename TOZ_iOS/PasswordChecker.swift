//
//  PasswordChecker.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class PasswordChecker: TextChecker {
    func check(text password: String) -> Bool {
        return password.characters.count <= 30 && password.characters.count >= 6
    }
}
