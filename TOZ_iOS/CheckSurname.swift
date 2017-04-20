//
//  CheckSurname.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class CheckSurname: TextChecker {
    func check(text surname: String) -> Bool {
        return surname.characters.count <= 35
    }
}
