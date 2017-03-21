//
//  NetworkLayerConfiguration.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

class NetworkLayerConfiguration {

    class func setup() {
        // Backend Configuration
        let url = URL(string: "http://dev.patronage2017.intive-projects.com")!
        let conf = BackendConfiguration(baseURL: url)
        BackendConfiguration.shared = conf
    }
}
