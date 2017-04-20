//
//  CheckPhoneNumber.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class CheckPhoneNumber: TextChecker {
    func check(text: String) -> Bool {
        let textIsInt = Int(text) != nil ? text.characters.count == 6 || text.characters.count == 9 : false
        return textIsInt
    }
}
