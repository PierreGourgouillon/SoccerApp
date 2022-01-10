//
//  CurrentMatchsViewModel_Specs.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 10/01/2022.
//

import Foundation
@testable import MySoccerApp
import XCTest

class CurrentMatchsViewModel_Specs: XCTestCase {

    func test_Recovery_of_hour_syntax() {

        guard let date = formatDate(str: "2022-01-10T22:19:11+0000") else { return }
        let team = Team(name: "Test", logo: "Test")
        let match = Match(homeTeam: team, awayTeam: team, date: date, scoreHome: 1, scoreAway: 0, place: "Stade Test")
        givenViewModel(match: match)
        whenGetHour()
        thenResponse(is: "23:19")
    }

    func test_Recovery_of_date_syntax() {
        guard let date = formatDate(str: "2022-01-10T22:19:11+0000") else { return }

        let team = Team(name: "Test", logo: "Test")
        let match = Match(homeTeam: team, awayTeam: team, date: date, scoreHome: 1, scoreAway: 0, place: "Stade Test")
        givenViewModel(match: match)
        whenGetDate()
        thenResponse(is: "10 JAN")
    }

    private func givenViewModel(match: Match) {
        viewModel = CurrentMatchsViewModel(match: match)
    }

    private func formatDate(str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let datee = dateFormatter.date(from:str) else { return nil }
        return datee
    }

    private func whenGetHour() {
        response = viewModel.getHour()
    }

    private func whenGetDate() {
        response = viewModel.getDate()
    }

    private func thenResponse(is expected: String) {
        XCTAssertEqual(expected, response)
    }

    private var viewModel: CurrentMatchsViewModel!
    private var response: String!
}
