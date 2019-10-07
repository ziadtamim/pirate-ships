//
//  PirateShipsTests.swift
//  PirateShipsTests
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import XCTest
@testable import PirateShips

class PirateShipServiceTests: XCTestCase {
    var subject: ShipService!
    var httpClient: FakeHTTPClient!

    override func setUp() {
        super.setUp()
        httpClient = FakeHTTPClient()
        subject = ShipService(httpClient: httpClient)
    }

    func testShips_responseDecodingSuccess() {
        var responseResult: Result<[ShipViewModel],Error>?
        let expect = expectation(description: "Response completed")

        httpClient.request_stubbed[.ships()] = .success(Fixtures.data(fromJSON: "valid-response"))

        subject.ships {
            result in

            responseResult = result
            expect.fulfill()
        }

        waitForExpectations(timeout: 5.0, handler: nil)

        XCTAssertEqual(try responseResult?.get(), Fixtures.validShips())
    }

    func testShips_responseMissingGreetingKeyDecodingSuccess() {
        var responseResult: Result<[ShipViewModel],Error>?
        let expect = expectation(description: "Response completed")

        httpClient.request_stubbed[.ships()] = .success(Fixtures.data(fromJSON: "valid-response-missing-greeting"))

        subject.ships {
            result in

            responseResult = result
            expect.fulfill()
        }

        waitForExpectations(timeout: 5.0, handler: nil)

        XCTAssertEqual(try responseResult?.get(), Fixtures.validShips())
    }

    func testShips_responseDecodingFailure() {
        var responseResult: Result<[ShipViewModel],Error>?
        let expect = expectation(description: "Response completed")

        httpClient.request_stubbed[.ships()] = .success(Fixtures.data(fromJSON: "invalid-response"))

        subject.ships {
            result in

            responseResult = result
            expect.fulfill()
        }

        waitForExpectations(timeout: 5.0, handler: nil)

        XCTAssertThrowsError(try responseResult?.get())
    }

}

extension ShipViewModel: Equatable {
    public static func == (lhs: ShipViewModel, rhs: ShipViewModel) -> Bool {
        return lhs.model == rhs.model && lhs.title == rhs.title && lhs.price == rhs.price && lhs.description == rhs.description && lhs.imageURL == rhs.imageURL && lhs.greeting == rhs.greeting
    }
}
