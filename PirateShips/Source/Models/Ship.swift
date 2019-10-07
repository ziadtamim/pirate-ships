//
//  Ship.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

struct Ship: Decodable, Equatable {
    enum GreetingType: String, Decodable {
        case ah, ay, ar, yo
    }

    let id: Int
    let title: String
    let description: String
    let price: Int
    let image: String
    let greetingType: GreetingType

    private enum CodingKeys: CodingKey {
        case id, title, description, price, image, greetingType
    }
}

extension Ship {
    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        id = try map.decode(.id)
        title = try map.decode(.title)
        description = try map.decode(.description)
        price = try map.decode(.price)
        image = try map.decode(.image)
        greetingType = try map.decodeIfPresent(.greetingType) ?? .ah
    }
}

extension Ship.GreetingType: CustomStringConvertible {
    var description: String {
        switch self {
        case .ah: return "Ahoi!"
        case .ay: return "Aye Aye!"
        case .ar: return "Arrr!"
        case .yo: return "Yo ho hooo!"
        }
    }
}
