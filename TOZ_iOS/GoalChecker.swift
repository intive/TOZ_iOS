//
//  GoalChecker.swift
//  TOZ_iOS
//
//  Created by user on 09/05/2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class GoalChecker: TextChecker {
    func check(text: String) -> CheckResult {
        if text.characters.count == 0 {
            return .Invalid(error: "Pole wymagane")
        } else {
            return .Valid
        }
    }
}
