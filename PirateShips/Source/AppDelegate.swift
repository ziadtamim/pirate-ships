//
//  AppDelegate.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = Coordinator(window: window)
        coordinator?.instantiateInitialViewController()
        return true
    }

}

