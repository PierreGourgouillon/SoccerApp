//
//  SucceedingMatchInteractor.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 11/01/2022.
//

import Foundation
import XCTest
@testable import MySoccerApp

class SucceedingMatchInteractor: MatchInteractor {

    func matchOfTheWeek(withLeagueId leagueId: Int) async throws -> [Match] {

        guard let date = formatDate(str: "2022-01-10T22:19:11+0000") else { throw APICallerError.unknownError }
        let team = Team(name: "test", logo: "test")
        return [Match(id: "test", homeTeam: team, awayTeam: team, date: date, scoreHome: 1, scoreAway: 1, place: "test")]
    }

    private func formatDate(str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let datee = dateFormatter.date(from:str) else { return nil }
        return datee
    }

}
