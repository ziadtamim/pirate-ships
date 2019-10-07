//
//  FakeHTTPClient.swift
//  PirateShipsTests
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation
@testable import PirateShips

class FakeHTTPClient: HTTPClientProtocol {
    var request_wasCalled = false
    var request_wasCalled_withEndPoint = [EndPoint]()
    var request_stubbed = [EndPoint: Result<Data,Error>]()

    func request(_ endPoint: EndPoint, then handler: @escaping ClientHanlder) {
        request_wasCalled = true
        request_wasCalled_withEndPoint.append(endPoint)
        handler(request_stubbed[endPoint]!)
    }
}

extension EndPoint: Hashable {
    public static func == (lhs: EndPoint, rhs: EndPoint) -> Bool {
        return lhs.path == rhs.path && lhs.queryItems == rhs.queryItems
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(path)
        hasher.combine(queryItems)
    }
}
