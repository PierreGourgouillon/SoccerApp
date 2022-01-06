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

    let leagueRepository: LeagueRepository

    init() {
        self.leagueRepository = LeagueRepository()
    }

    func setCurrentLeague(league: League) {
        currentLeague = league
        //LeagueRepository().getMatchs()
    }

    func getLeague() {
        let mainLeaguesID = [39, 78, 140, 61, 135]

        do {
            let url = try DefaultRequestGenerator().generateRequest(endpoint: .leagues, method: .GET, queryParameters: ["league":"39","seasons":"2021"])
            print(url)
        } catch (let error) {
            print(error)
        }

        mainLeaguesID.forEach { numberID in
            /*leagueRepository.getLeague(with: numberID, year: 2021)
            leagues.append()*/
        }
    }
}
