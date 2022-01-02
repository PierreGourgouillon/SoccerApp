//
//  HomeViewModel.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var finalLeague: League?

    let teamOne = Team(logo: "https://media.api-sports.io/football/teams/40.png", name: "Liverpool")
    let teamTwo = Team(logo: "https://media.api-sports.io/football/teams/41.png", name: "Southampton")

    let leagues: [League]
    let match: Match
    let matchs: [Match]

    init() {
        self.match = Match(homeTeam: teamOne, outSideTeam: teamTwo, date: "30 OCT", hour: "06:04")
        self.matchs = [match, match, match, match]

        self.leagues =  [
            League(name: "Ligue 1", logo: "https://media.api-sports.io/football/leagues/61.png", year: 2021, teams: [teamOne, teamTwo]),
            League(name: "Ligue 2", logo: "https://media.api-sports.io/football/leagues/62.png", year: 2021, teams: [teamOne, teamTwo]),
            League(name: "National", logo: "https://media.api-sports.io/football/leagues/63.png", year: 2021, teams: [teamOne, teamTwo])
        ]
    }

    func getLeague() {
        LeagueInteractor().getLeague(forLeagueID: 39) { league in
            DispatchQueue.main.async {
                self.finalLeague = league
            }
        }
    }

}
