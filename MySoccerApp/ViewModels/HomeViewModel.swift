//
//  HomeViewModel.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var matchs: [Match]?
    @Published var currentLeague: League?
    @Published var leagues: [League] = [League]()
    let leagueInteractor: LeagueInteractor
    let matchInteractor: MatchInteractor

    init() {
        self.leagueInteractor = LeagueInteractor(apiCaller: DefaultAPICaller(), requestGenerator: DefaultRequestGenerator())
        self.matchInteractor =  MatchInteractor(apiCaller: DefaultAPICaller(), requestGenerator: DefaultRequestGenerator())
    }

    func setCurrentLeague(league: League) {
        currentLeague = league
    }

    @MainActor
    func getLeague() async throws {
        let mainLeaguesID = [39, 78, 140, 61, 135]

        do {
            for id in mainLeaguesID {
                let responseLeague = try await leagueInteractor.getLeague(with: id)
                leagues.append(responseLeague)
            }
        }catch {
            throw APICallerError.internalServerError
        }
    }

    @MainActor
    func getMatchs(leagueId: Int) async throws {
        do {
            let responseMatchs = try await matchInteractor.matchOfTheWeek(withLeagueId: leagueId)
            matchs = responseMatchs
        }catch {
            throw APICallerError.internalServerError
        }
    }

}
