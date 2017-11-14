//
//  CheckName.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class NameChecker: TextChecker {
    func check(text: String) -> CheckResult {
        if text.count == 0 {
            return .invalid(error: "Pole wymagane")
        } else if text.count > 35 {
            return .invalid(error: "Wpisz poprawne imię")
        } else {
            return .valid
        }
    }
}
