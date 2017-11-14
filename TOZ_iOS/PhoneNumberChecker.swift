//
//  CheckPhoneNumber.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class PhoneNumberChecker: TextChecker {

    func check(text: String) -> CheckResult {
        if text.count == 0 {
            return .invalid(error: "Pole wymagane")
        } else if (Int(text) != nil ? text.count == 9 || text.count == 11 : false) == false {
            return .invalid(error: "Wpisz poprawny numer")
        } else {
            return .valid
        }
    }
}
