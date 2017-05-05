//
//  BasicChecker.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class BasicChecker: TextChecker {
    func check(text: String) -> CheckResult {
        if text.characters.count == 0 {
            return .Invalid(error: "Pole wymagane")
        } else if text.characters.count > 35 {
            return .Invalid(error: "Wpisz poprawne dane")
        } else {
            return .Valid
        }
    }
}
