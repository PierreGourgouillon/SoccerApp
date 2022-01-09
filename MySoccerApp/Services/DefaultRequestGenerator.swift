//
//  DefaultRequestGenerator.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 06/01/2022.
//

import Foundation

protocol RequestGenerator {
    func generateRequest(endpoint: HTTPEndpoint, method: HTTPMethod, queryParameters: [String: String]?) throws -> URLRequest
}

class DefaultRequestGenerator: RequestGenerator {

    private let fixHeaders = ["x-rapidapi-key": API_KEY]

    func generateRequest(endpoint: HTTPEndpoint, method: HTTPMethod, queryParameters: [String: String]?) throws -> URLRequest {

        let url = try computeURL(endpoint: endpoint, queryParams: queryParameters)

        var urlRequest = URLRequest(url: url)

        fixHeaders.forEach { header in
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }

        urlRequest.httpMethod = method.rawValue

        return urlRequest
    }

    private func computeURL(endpoint: HTTPEndpoint, queryParams: [String: String]?) throws -> URL {

        let stringURL = "https://v3.football.api-sports.io" + endpoint.rawValue

        guard let url = URL(string: stringURL) else {
            throw APICallerError.requestGenerationError
        }

        if let queryParams = queryParams, var componentsURL = URLComponents(string: stringURL) {
            componentsURL.queryItems = queryParams.map {
                URLQueryItem(name: $0.key, value: $0.value)
            }
            return componentsURL.url ?? url
        }

        return url
    }

}
