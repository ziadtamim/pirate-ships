//
//  EndPoint+Queries.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

extension EndPoint {
    static func ships() -> EndPoint {
        return EndPoint(
            path: "/mobile/interview-test/pirateships",
            queryItems: []
        )
    }
}
