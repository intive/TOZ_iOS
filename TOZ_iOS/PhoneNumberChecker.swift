//
//  CheckPhoneNumber.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class PhoneNumberChecker: TextChecker {
    func check(text: String) -> Bool {
        return Int(text) != nil ? text.characters.count == 9 || text.characters.count == 11 : false
    }
}
