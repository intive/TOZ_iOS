//
//  NewsItem.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

struct NewsItem: ParsedItem {
    
    let id: String?
    let title: String
    let contents: String
    let type: String?
    let photoUrl: String
    let created: Int?
    let lastModified: Int?
    let published: Int
}
