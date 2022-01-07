//
//  LeagueInteractor_Specs.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 07/01/2022.
//

import XCTest
@testable import MySoccerApp

class LeagueInteractor_Specs: XCTestCase {


    func test_Get_League() {
        
    }

//    func test_Throw_Error_When_Get_League_Failing() async {
//        givenInteractor(body: Data())
//        await whenGettingResponse(idLeague: 28, season: 2021)
//        XCTAssertEqual(APICallerError.internalServerError, interactorError)
//    }

//    private func givenInteractor(body: Data) {
//        self.interactor = LeagueInteractor(apiCaller: FakeAPICaller(),
//                                           requestGenerator: FakeRequestGenerator(body: body))
//    }

    private func whenGettingResponse(idLeague: Int, season: Int) async {
        do {
            interactorResponse = try await self.interactor.getLeague(with: idLeague, season: season)
        } catch (let error) {
            interactorError = (error as! APICallerError)
        }
    }

    private var interactorResponse: Any!
    private var interactor: LeagueInteractor!
    private var interactorError: APICallerError!
}
