//
//  AlertTests.swift
//  PirateShipsTests
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import XCTest
@testable import PirateShips

class AlertTests: XCTestCase {
    var fakeViewController: PartiallyFakeViewController!

    override func setUp() {
        super.setUp()
        fakeViewController = PartiallyFakeViewController()
    }

    func testPresent_tellsTheViewControllerToPresentAnAlert() {
        Alert.present(from: fakeViewController, title: "", message: "", dismissButtonTitle: "")

        XCTAssertTrue(fakeViewController.present_wasCalled)
        XCTAssertTrue(fakeViewController.present_wasCalled_withArgs?.viewControllerToPresent is UIAlertController)
    }

    func testPresent_doesNotConfigureCallbackForPresentation() {
        Alert.present(from: fakeViewController, title: "", message: "", dismissButtonTitle: "")

        XCTAssertNil(fakeViewController.present_wasCalled_withArgs?.completion)
    }

    func testPresent_configureTheAlertWithTitleAndMessage() {
        Alert.present(from: fakeViewController, title: "Some alert title", message: "Some alert message", dismissButtonTitle: "")

        let alertController = fakeViewController.present_wasCalled_withArgs?.viewControllerToPresent as? UIAlertController

        XCTAssertEqual(alertController?.title, "Some alert title")
        XCTAssertEqual(alertController?.message, "Some alert message")
    }
}


