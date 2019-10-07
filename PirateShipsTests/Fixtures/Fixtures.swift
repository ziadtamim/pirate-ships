//
//  Fixtures.swift
//  PirateShipsTests
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation
@testable import PirateShips

class Fixtures {
    class func data(fromJSON name: String) -> Data {
        let bundle = Bundle(for: self)
        let url = bundle.url(forResource: name, withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    class func validShips() -> [ShipViewModel] {
        return [Ship(id: 84375012, title: "How misty. You ransack like an ale.", description: "Anchors scream on yellow fever at haiti! How sunny. You haul like a cloud.", price: 34, image: "http://images.bit-tech.net/content_images/2008/01/pirates_of_the_burning_sea/p.jpg", greetingType: .ah)].compactMap(ShipViewModel.init)
    }

    class func validShip() -> ShipViewModel {
        return validShips().first!
    }
}
