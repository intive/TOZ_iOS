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
        if text.count == 0 {
            return .invalid(error: "Pole wymagane")
        } else if text.count > charactersLimit {
            return .invalid(error: "Przekroczono limit \(charactersLimit) znaków")
        } else {
            return .valid
        }
    }
}
