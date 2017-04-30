//
//  CheckSurname.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class SurnameChecker: TextChecker {
    func check(text: String) -> CheckResult {
        if text == "" {
            return .Invalid(error: "Pole wymagane")
        } else if text.characters.count > 35 {
            return .Invalid(error: "Wpisz poprawne Nazwisko")
        } else {
            return .Valid
        }
    }
}
