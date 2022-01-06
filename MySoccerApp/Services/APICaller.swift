//
//  APICaller.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 06/01/2022.
//

import Foundation

protocol APICaller {
    func call<T: Decodable>(_ urlRequest: URLRequest, decodedType: T.Type) async throws -> [T]
}

class DefaultAPICaller: APICaller {

    private let jsonDecoder = JSONDecoder()
    private let goodStatusCode = Set<Int>(200...207)
    private let urlSession = URLSession.shared

    func call<T: Decodable>(_ urlRequest: URLRequest, decodedType: T.Type) async throws -> [T] {
        let result: (Data, URLResponse)? = try? await urlSession.data(for: urlRequest, delegate: nil)

        guard let (data, response) = result,
              let strongResponse = response as? HTTPURLResponse else {
                  throw APICallerError.internalServerError
              }

        if !goodStatusCode.contains(strongResponse.statusCode) {
            throw APICallerError.badRequest
        }

        do {
            let result = try jsonDecoder.decode(APIResponse<T>.self, from: data)
            return result.response
        }catch {
            throw APICallerError.decodeError
        }
    }
}
