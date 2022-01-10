//
//  ModelFormator_Specs.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 10/01/2022.
//

import Foundation
import XCTest
@testable import MySoccerApp

class ModelFormator_Specs: XCTestCase {

    func test_Return_match_is_succeeding() {
        let restMatch = RestResponseMatch(
            fixture: RestFixture(date: "2022-01-10T22:19:11+0000", timestamp: 1, venue: RestPlace(name: "test")),
            teams: RestTeams(home: RestTeam(name: "test", logo: "test"), away: RestTeam(name: "test", logo: "test")),
            score: RestScore(fulltime: RestScoreFullTime(home: 1, away: 1))
        )

        guard let date = formatDate(str: "2022-01-10T22:19:11+0000") else { return }

        let expected = Match(
            homeTeam: Team(name: "test", logo: "test"),
            awayTeam: Team(name: "test", logo: "test"),
            date: date,
            scoreHome: 1,
            scoreAway: 1,
            place: "test"
        )

        whenFormatMatch(restMatch: restMatch)
        thenReponse(is: expected)
    }

    private func whenFormatMatch(restMatch: RestResponseMatch) {
        response = ModelFormator.formatRestMatch(rest: restMatch)
    }

    private func thenReponse(is expected: Match) {
        XCTAssertEqual(expected.homeTeam, response.homeTeam)
        XCTAssertEqual(expected.awayTeam, response.awayTeam)
        XCTAssertEqual(expected.date, response.date)
        XCTAssertEqual(expected.scoreHome, response.scoreHome)
        XCTAssertEqual(expected.scoreAway, response.scoreAway)
        XCTAssertEqual(expected.place, response.place)

    }

    private func formatDate(str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let datee = dateFormatter.date(from:str) else { return nil }
        return datee
    }


    private var response: Match!
}
