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
        self.leagueInteractor = LeagueInteractor()
    }

    func setCurrentLeague(league: League) {
        currentLeague = league
        //LeagueInteractor().getMatchs()
    }

    func getLeague() async throws {
        let mainLeaguesID = [39, 78, 140, 61, 135]

        do {
            let leagues = try await leagueInteractor.getLeague(with: 39)
            print(leagues)
        }catch {
            throw APICallerError.internalServerError
        }

        mainLeaguesID.forEach { numberID in
            /*leagueRepository.getLeague(with: numberID, year: 2021)
            leagues.append()*/
        }
    }
}
