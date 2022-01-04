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

    init() {

    }

    func getLeague() {
        let mainLeaguesID = [39, 78, 140, 61, 135]

        for leagueID in mainLeaguesID {
            LeagueInteractor().getLeague(forLeagueID: leagueID) { league in
                DispatchQueue.main.async {
                    self.currentLeague = league
                    self.leagues.append(league)
                }
            }
        }
    }
}
