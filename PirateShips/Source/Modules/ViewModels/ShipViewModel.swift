//
//  ShipViewModel.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

struct ShipViewModel: ViewModel {
    typealias ModelType = Ship

    let model: ModelType

    let title: String
    let price: String
    let description: String
    let imageURL: URL?
    let greeting: String

    init(model: ModelType) {
        self.model = model

        title = model.title
        price = "\(model.price)€"
        description = model.description
        imageURL = URL(string: model.image)
        greeting = model.greetingType.description
    }
}
