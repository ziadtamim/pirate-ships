//
//  Content.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

struct Content: Decodable,Equatable {
    let success: Bool
    let ships: [Ship]
}

extension Content {
    init(from decoder: Decoder) throws {
        let map = try ResponseScheme(from: decoder)
        success = map.success
        ships = map.ships.compactMap { $0?.value }
    }

    fileprivate struct ResponseScheme: Decodable {
        let success: Bool
        let ships: [Safe<Ship>?]
    }
}
