//
//  Safe+Decodable.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

struct Safe<Base: Decodable>: Decodable {
    let value: Base?

    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            value = try container.decode(Base.self)
        } catch {
            value = nil
        }
    }
}

extension KeyedDecodingContainer {
    func decode<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T {
        return try decode(type, forKey: key)
    }

    func decodeIfPresent<T: Decodable>(_ key: Key, as type: T.Type = T.self) throws -> T? {
        return try decodeIfPresent(type, forKey: key)
    }
}
