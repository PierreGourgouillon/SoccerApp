//
//  DefaultRequestGenerator_Specs.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 06/01/2022.
//

import XCTest
@testable import MySoccerApp

class DefaultRequestGenerator_Specs: XCTestCase {

    func test_Generates_Request_With_No_Query_Parameters() {
        guard let url = URL(string: "https://v3.football.api-sports.io" + HTTPEndpoint.leagues.rawValue) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        urlRequest.allHTTPHeaderFields = ["x-rapidapi-key": API_KEY]

        givenRequestGenerator()
        whenGeneratesrequest(endpoint: .leagues, method: .GET)
        thenRequest(is: urlRequest)
    }

    func test_Generates_Request_With_Query_Parameters() {
        let params = "?season=2021"
        guard let url = URL(string: "https://v3.football.api-sports.io" + HTTPEndpoint.leagues.rawValue + params) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        urlRequest.allHTTPHeaderFields = ["x-rapidapi-key": API_KEY]

        givenRequestGenerator()
        whenGeneratesrequest(endpoint: .leagues, method: .GET, queryParameters: ["season":"2021"])
        thenRequest(is: urlRequest)
    }

    private func givenRequestGenerator() {
        requestGenerator = DefaultRequestGenerator()
    }

    private func whenGeneratesrequest(endpoint: HTTPEndpoint, method: HTTPMethod, queryParameters: [String: String]? = nil) {
        do {
            self.request = try requestGenerator.generateRequest(endpoint: endpoint, method: method,
                                                                queryParameters: queryParameters)
        } catch (let error){
            self.error = (error as! APICallerError)
        }
    }

    private func thenRequest(is expectedRequest: URLRequest) {
        XCTAssertEqual(expectedRequest.url, request.url)
        XCTAssertEqual(expectedRequest.httpMethod, request.httpMethod)
        XCTAssertEqual(expectedRequest.allHTTPHeaderFields, request.allHTTPHeaderFields)
        XCTAssertEqual(expectedRequest.httpBody, request.httpBody)
    }

    private var request: URLRequest!
    private var requestGenerator: DefaultRequestGenerator!
    private var error: APICallerError!
}
