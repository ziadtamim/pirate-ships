//
//  ShipsViewController.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

final class ShipsViewController: UICollectionViewController {

    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        instantiateInitialState()
    }

    private func instantiateInitialState() {
        self.title = "Pirate Ships"
    }
}
