//
//  SucceedingLeagueInteractor.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 11/01/2022.
//

import Foundation
@testable import MySoccerApp
import XCTest

class SucceedingLeagueInteractor: LeagueInteractor {

    func getLeague(with idLeague: Int) async throws -> League {
        return League(id: 1, name: "test", logo: "test", season: 2021, standings: [Standing(rank: 1, team: Team(name: "test", logo: "test"), form: "WWWWL")])
    }
}
