//
//  Alert.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import UIKit

enum Alert {
    @discardableResult
    static func present(from: UIViewController, title: String, message: String, dismissButtonTitle: String) -> UIAlertController {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(
            title: dismissButtonTitle,
            style: .default,
            handler: nil
        )
        alertController.addAction(alertAction)
        from.present(alertController, animated: true)

        return alertController
    }
}
