//
//  ViewModel.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

protocol ViewModel {
    associatedtype ModelType

    var model: ModelType { get }

    init(model: ModelType)
}
