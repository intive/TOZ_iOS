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
public final class BackendConfiguration {

    let baseURL: URL

    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public static var shared: BackendConfiguration = BackendConfiguration(baseURL: URL(string: "http://dev.patronage2017.intive-projects.com")!)
}
