//
//  SignUpItem.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

struct SignUpItem: ParsedItem {
    let userID: String?
    let password: String
    let roles: Array[String]?
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    let passwordChangeDate: Int?
}
