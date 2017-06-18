//
//  ListOfAnimalsItem.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

enum AnimalType {
    case DOG, CAT
    var localizedType: String {
        switch self {
        case .DOG:
            return "Pies"
        case .CAT:
            return "Kot"
        }
    }
}

enum AnimalSex {
    case MALE, FEMALE, UNKNOWN
    var localizedSex: String {
        switch self {
        case .MALE:
            return "On"
        case .FEMALE:
            return "Ona"
        case .UNKNOWN:
            return "Nieznana"
        }
    }
}

struct AnimalItem: ParsedItem {
    let animalID: String
    let name: String
    let type: AnimalType
    let sex: AnimalSex
    let description: String?
    let address: String?
    let created: Date?
    let lastModified: Date?
    let imageUrl: URL?
    let galleryURLs: [URL]?
}
