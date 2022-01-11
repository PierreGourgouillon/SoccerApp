//
//  HomeViewModel_Specs.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 11/01/2022.
//

import Foundation
import XCTest
@testable import MySoccerApp

class HomeViewModel_Specs: XCTestCase {

    func test_Get_league_with_succeeding_request() async {
        let league = League(id: 1, name: "test", logo: "test", season: 2021, standings: [Standing(rank: 1, team: Team(name: "test", logo: "test"), form: "WWWWL")])
        givenViewModelSuccedingInteractor()
        await whenGetLeague()
        thenResponseGetLeague(is: [league, league, league, league, league])
    }

    func test_Get_Matchs_with_succeeding_request() async {
        guard let date = formatDate(str: "2022-01-10T22:19:11+0000") else { return }
        let team = Team(name: "test", logo: "test")
        let expected = [Match(id: "test", homeTeam: team, awayTeam: team, date: date, scoreHome: 1, scoreAway: 1, place: "test")]
        givenViewModelSuccedingInteractor()
        await whenGetMatchs()
        thenResponseMatchs(is: expected)
    }

    func test_Get_league_with_failling_request() async {
        givenViewModelFaillingInteractor()
        await whenGetLeague()
        thenError(is: APICallerError.internalServerError)
    }

    func test_Get_match_with_failling_request() async {
        givenViewModelFaillingInteractor()
        await whenGetMatchs()
        thenError(is: APICallerError.internalServerError)
    }

    private func givenViewModelSuccedingInteractor() {
        viewModel = HomeViewModel(leagueInteractor: SucceedingLeagueInteractor(), matchInteractor: SucceedingMatchInteractor())
    }

    private func givenViewModelFaillingInteractor() {
        viewModel = HomeViewModel(leagueInteractor: FaillingLeagueInteractor(), matchInteractor: FaillingMatchInteractor())
    }

    private func whenGetLeague() async {
        do {
            try await viewModel.getLeague()
        } catch (let error) {
            self.error = (error as? APICallerError)
        }
    }

    private func whenGetMatchs() async {
        do {
            try await viewModel.getMatchs(leagueId: 1)
        } catch (let error) {
            self.error = (error as? APICallerError)
        }
    }

    private func thenResponseGetLeague(is expected: [League]) {
        XCTAssertEqual(expected, viewModel.leagues)
    }

    private func thenResponseMatchs(is expected: [Match]) {
        XCTAssertEqual(expected, viewModel.matchs)
    }

    private func thenError(is expected: APICallerError) {
        XCTAssertEqual(expected, self.error)
    }

    private func formatDate(str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let datee = dateFormatter.date(from:str) else { return nil }
        return datee
    }

    private var viewModel: HomeViewModel!
    private var response: Any!
    private var error: APICallerError!
}
