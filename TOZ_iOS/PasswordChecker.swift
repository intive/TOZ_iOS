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
        if text == "" {
            return .Invalid(error: "Pole wymagane")
        } else if text.characters.count > 30 || text.characters.count < 6 {
            return .Invalid(error: "Poprawne hasło ma od 6 do 30 znaków")
        }
        if let confirmView = confirmView, confirmView.text != text {
            return .Invalid(error: "Wprowadź poprawne hasło")

        }
        return .Valid
    }

}
