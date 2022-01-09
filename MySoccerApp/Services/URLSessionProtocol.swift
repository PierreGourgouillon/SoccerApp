//
//  URLSessionProtocol.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 07/01/2022.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
