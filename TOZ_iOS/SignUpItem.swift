//
//  SignUpItem.swift
//  TOZ_iOS
//
//  Created by patronage on 28.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

struct SignUpItem: ParsedItem {
    private let id: String
    private let password: String
    private let roles: Array<String>
    private let name: String
    private let surname: String
    private let phoneNumber: String
    private let email: String
    private let passwordChangeDate: Int
}
