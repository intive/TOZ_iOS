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

    func check(text: String) -> CheckResult {
        if text == "" {
            return .Invalid(error: "Pole wymagane")
        } else if text.characters.count > 35 {
            return .Invalid(error: "Wpisz poprawne imię")
        } else {
            return .Valid
        }
    }
}
