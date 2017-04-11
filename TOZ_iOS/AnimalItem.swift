//
//  ListOfAnimalsItem.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

struct AnimalItem: ParsedItem {
    let animalID: String
    let name: String
    let type: String
    let sex: String
    let description: String?
    let address: String?
    let created: Date?
    let lastModified: Int?
    let imageUrl: String?
}
