//
//  EmailChecker.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class EmailChecker: TextChecker {
    func check(text name: String) -> CheckResult {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            let isEmail: Bool = regex.firstMatch(in: name, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: name.characters.count)) != nil
            if isEmail {
                return .Valid
            } else {
                return .Invalid(error: "Wpisz prawidłową nazwę użytkownika")
            }
        } catch {
            return .Invalid(error: "Wpisz prawidłową nazwę użytkownika")
        }
    }
}
