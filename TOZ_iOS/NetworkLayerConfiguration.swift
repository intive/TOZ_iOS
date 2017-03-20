//
//  NetworkLayerConfiguration.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation
//import Network

class NetworkLayerConfiguration {

    class func setup() {
        // Backend Configuration
        let url = URL(string: "http://swapi.co/api")!
        let conf = BackendConfiguration(baseURL: url)
        BackendConfiguration.shared = conf

        // Network Queue
//        NetworkQueue.shared = NetworkQueue()
    }
}
