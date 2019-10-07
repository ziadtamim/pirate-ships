//
//  HTTPClient.swift
//  PirateShips
//
//  Created by Ziad Tamim on 05.10.19.
//  Copyright © 2019 ByZiad. All rights reserved.
//

import Foundation

typealias ClientHanlder = (Result<Data,Error>) -> Void

protocol HTTPClientProtocol {
    func request(_ endPoint: EndPoint, then handler: @escaping ClientHanlder)
}

struct HTTPClient: HTTPClientProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func request(_ endPoint: EndPoint, then handler: @escaping ClientHanlder) {
        guard let url = endPoint.url else {
            return assertionFailure("Invalid End Point URL.")
        }

        let task = urlSession.dataTask(with: url) {
            data, response, error in

            DispatchQueue.main.async {
                if let error = error {
                    handler(.failure(error))
                } else if let data = data {
                    handler(.success(data))
                }
            }
        }

        task.resume()
    }
}
