//
//  TextLengthChecker.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class TextLengthChecker: TextChecker {

    let charactersLimit: Int

    init(charactersLimit: Int) {
        self.charactersLimit = charactersLimit
    }

    func check(text: String) -> CheckResult {
        if text.characters.count == 0 {
            return .Invalid(error: "Pole wymagane")
        } else if text.characters.count > charactersLimit {
            return .Invalid(error: "Przekroczono limit \(charactersLimit) znaków")
        } else {
            return .Valid
        }
    }
}
