//
//  DefaultAPICaller_Specs.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 07/01/2022.
//

import XCTest
@testable import MySoccerApp

class DefaultAPICaller_Specs: XCTestCase {

    func test_Gets_data_in_back_end() async {
        let body = "{\"response\": [{\"argument\": \"test\"}]}"
        let expectedBody = TestDecodable(argument: "test")

        givenAPICaller(withHTTPResponseCode: 200, body: body.data(using: .utf8)!)
        await whenMakingCall(withURLRequest: request, decodeTo: TestDecodable.self)
        thenAPICallisSucceeding(with: expectedBody)
    }

    func test_Throw_error_with_HTTPCode_is_400() async {
        givenAPICaller(withHTTPResponseCode: 400)
        await whenMakingCall(withURLRequest: request, decodeTo: TestDecodable.self)
        thenError(is: "Une erreur est survenue")
    }

    func test_Throw_error_when_body_is_incorrect() async {
        let body = "{\"nikomouk\": \"hbhbhb\"}"
        givenAPICaller(withHTTPResponseCode: 200, body: body.data(using: .utf8)!)
        await whenMakingCall(withURLRequest: request, decodeTo: TestDecodable.self)
        thenError(is: "Une erreur est survenue")
    }

    private func givenAPICaller(withHTTPResponseCode: Int, body: Data = Data()) {
        let urlSession = FakeURLSession(expected: givenURLSession(httpCode: withHTTPResponseCode), with: body)
        apiCaller = DefaultAPICaller(urlSession: urlSession)
    }

    private func givenURLSession(httpCode: Int) -> HTTPURLResponse {
        HTTPURLResponse(url: request.url!, statusCode: httpCode, httpVersion: nil, headerFields: request.allHTTPHeaderFields)!
    }

    private func whenMakingCall<T: Decodable>(withURLRequest: URLRequest, decodeTo: T.Type) async {

        do {
            self.response = try await apiCaller.call(withURLRequest, decodedType: T.self)

        } catch (let error) {
            self.error = (error as! APICallerError)
        }
    }

    private func thenError(is expected: String) {
        XCTAssertNil(response)
        XCTAssertEqual(expected, self.error.errorDescription)
    }

    private func thenAPICallisSucceeding(with responseBody: TestDecodable) {
        XCTAssertNil(error)
        XCTAssertEqual(responseBody, (self.response. as? TestDecodable))
    }


    private var request: URLRequest {
        let url = URL(string: "http://www.google.com/nikomouk")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.GET.rawValue
        urlRequest.allHTTPHeaderFields = ["x-rapidapi-key": API_KEY]
        
        return urlRequest
    }

    private var apiCaller: DefaultAPICaller!
    private var error: APICallerError!
    private var response: Any!
}

struct TestDecodable: Decodable, Equatable {
    let argument: String
}
