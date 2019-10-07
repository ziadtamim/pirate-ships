//
//  EndPoint.swift
//  PirateShips
//
//  Created by Ziad Tamim on 05.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

struct EndPoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension EndPoint {
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = BaseURL.scheme
        urlComponents.host = BaseURL.host
        urlComponents.path = path
        urlComponents.queryItems = queryItems

        return urlComponents.url
    }
}
