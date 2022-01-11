//
//  FaillingMatchInteractor.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 11/01/2022.
//

import Foundation
@testable import MySoccerApp

class FaillingMatchInteractor: MatchInteractor {

    func matchOfTheWeek(withLeagueId leagueId: Int) async throws -> [Match] {
        throw APICallerError.internalServerError
    }
}
