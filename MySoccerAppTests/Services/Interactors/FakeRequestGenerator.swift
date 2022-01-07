//
//  FakeRequestGenerator.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 07/01/2022.
//

import Foundation
@testable import MySoccerApp

class FakeRequestGenerator: RequestGenerator {
    private var body: Data

    init(body: Data) {
        self.body = body
    }

    func generateRequest(endpoint: HTTPEndpoint, method: HTTPMethod, queryParameters: [String : String]?) throws -> URLRequest {
        let url = URL(string: "http://www.google.com/nikomouk")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpBody = body
        return urlRequest
    }
}
