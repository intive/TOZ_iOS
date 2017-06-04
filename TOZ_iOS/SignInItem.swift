//
//  SignInItem.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

struct SignInItem: ParsedItem {
    let jwt: String
    let userId: String
    let email: String
    let name: String
    let surname: String
}
