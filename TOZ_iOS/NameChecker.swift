//
//  CheckName.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class NameChecker: TextChecker {
    func check(text name: String) -> Bool {
        return name.characters.count <= 35
    }
}
