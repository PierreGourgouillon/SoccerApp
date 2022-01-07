//
//  FakeURLSession.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 07/01/2022.
//

import Foundation
@testable import MySoccerApp

class FakeURLSession: URLSessionProtocol {

    private let response: URLResponse
    private let data: Data

    init(expected response: URLResponse, with data: Data = Data()) {
        self.response = response
        self.data = data
    }

    func data(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        return (data, response)
    }
}
