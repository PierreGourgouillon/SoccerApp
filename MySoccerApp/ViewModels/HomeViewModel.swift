//
//  HomeViewModel.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var currentLeague: League?
    @Published var leagues: [League] = [League]()
    let leagueInteractor: LeagueInteractor

    init() {
        self.leagueInteractor = LeagueInteractor(apiCaller: DefaultAPICaller(), requestGenerator: DefaultRequestGenerator())
    }

    func setCurrentLeague(league: League) {
        currentLeague = league
        //LeagueInteractor().getMatchs()
    }

    @MainActor
    func getLeague() async throws {
        let mainLeaguesID = [39, 78, 140, 61, 135]

        do {
            for id in mainLeaguesID {
                let responseLeague = try await leagueInteractor.getLeague(with: id)
                leagues.append(responseLeague[0].league)
            }
        }catch {
            throw APICallerError.internalServerError
        }
    }
}
