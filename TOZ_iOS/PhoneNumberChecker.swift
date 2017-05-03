//
//  CheckPhoneNumber.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class PhoneNumberChecker: TextChecker {

    func check(text: String) -> CheckResult {
        if text.characters.count == 0 {
            return .Invalid(error: "Pole wymagane")
        } else if (Int(text) != nil ? text.characters.count == 9 || text.characters.count == 11 : false) == false {
            return .Invalid(error: "Wpisz poprawny numer")
        } else {
            return .Valid
        }
    }
}
