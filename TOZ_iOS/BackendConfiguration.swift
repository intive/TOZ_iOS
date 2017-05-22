//
//  BackendConfiguration.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation
/**
 Class storing backend URL so other system elements know where to send requests to.
 */
final class BackendConfiguration {

    let baseURL: URL
    let photosURL: URL

    init(baseURL: URL, photosURL: URL) {
        self.baseURL = baseURL
        self.photosURL = photosURL
    }

    static var shared: BackendConfiguration = mockBackend ? BackendConfiguration(baseURL: URL(string: "https://i.imgur.com")!, photosURL: URL(string: "https://i.imgur.com")!) : BackendConfiguration(baseURL: URL(string: "http://dev.patronage2017.intive-projects.com/api")!, photosURL: URL(string: "http://dev.patronage2017.intive-projects.com/")!)
}
