//
//  ShipService.swift
//  PirateShips
//
//  Created by Ziad Tamim on 07.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

struct ShipService {
    static let shared = ShipService()

    private let httpClient: HTTPClientProtocol
    private let jsonDecoder: JSONDecoder

    init(httpClient: HTTPClientProtocol = HTTPClient(), jsonDecoder: JSONDecoder = JSONDecoder()) {
        self.httpClient = httpClient
        self.jsonDecoder = jsonDecoder
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func ships(handler: @escaping (Result<[ShipViewModel],Error>) -> Void) {
        httpClient.request(.ships()) {
            result in

            do {
                handler(.success(try self.responseHandler(result: result)))
            } catch {
                handler(.failure(error))
            }
        }
    }

    private func responseHandler(result: Result<Data,Error>) throws -> [ShipViewModel]  {
        let data = try result.get()
        let content = try jsonDecoder.decode(Content.self, from: data)
        return content.ships.compactMap(ShipViewModel.init)
    }
}
