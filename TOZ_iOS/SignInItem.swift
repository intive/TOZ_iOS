//
//  SignInItem.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

struct SignInItem: ParsedItem {
    let email: String
    let password: String
    let userID: String?
    let forename: String
    let surname: String
    let role: String
}
