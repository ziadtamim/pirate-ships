//
//  PartiallyFakeViewController.swift
//  PirateShipsTests
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

class PartiallyFakeViewController: UIViewController {
    var present_wasCalled = false
    var present_wasCalled_withArgs: (viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?)? = nil

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        present_wasCalled = true
        present_wasCalled_withArgs = (viewControllerToPresent: viewControllerToPresent, animated: flag, completion: completion)
    }
}
