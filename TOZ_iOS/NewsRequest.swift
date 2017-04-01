//
//  NewsRequest.swift
//  TOZ_iOS
//
//  Created by Rafal Gorczynski on 01.04.2017.
//  Copyright © 2017 intive. All rights reserved.
//

import Foundation

final class NewsRequest: BackendAPIRequest {
    
    var endpoint: String {
        return "/news"
    }
    
    var method: NetworkService.Method {
        return .GET
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var headers: [String: String]? {
        return defaultJSONHeaders()
    }
}
