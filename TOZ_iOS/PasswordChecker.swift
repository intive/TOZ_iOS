//
//  PasswordChecker.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class PasswordChecker: TextChecker {

    weak var confirmView: TextInputView?

    func check(text: String) -> CheckResult {
        if text.count == 0 {
            return .invalid(error: "Pole wymagane")
        } else if text.count > 30 || text.count < 6 {
            return .invalid(error: "Niepoprawne hasło")
        }
        if let confirmView = confirmView, confirmView.text != text {
            return .invalid(error: "Wprowadzone hasła są różne")

        }
        return .valid
    }

}
