//
//  Coordinator.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

final class Coordinator {
    weak var window: UIWindow?

    var rootViewController: UINavigationController? {
        return self.window?.rootViewController as? UINavigationController
    }

    init(window: UIWindow?) {
        self.window = window

        self.window?.rootViewController = UINavigationController()
        self.window?.makeKeyAndVisible()
    }

    func instantiateInitialViewController() {
        let viewController = ShipsViewController()

        rootViewController?.pushViewController(viewController, animated: false)
    }
}
