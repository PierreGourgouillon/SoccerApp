//
//  FaillingLeagueInteractor.swift
//  MySoccerAppTests
//
//  Created by Pierre Gourgouillon on 11/01/2022.
//

import Foundation
@testable import MySoccerApp

class FaillingLeagueInteractor: LeagueInteractor {

    func getLeague(with idLeague: Int) async throws -> League {
        throw APICallerError.internalServerError
    }
}
