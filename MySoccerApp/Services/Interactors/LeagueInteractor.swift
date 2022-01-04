//
//  LeagueInteractor.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 01/01/2022.
//

import Foundation

class LeagueInteractor {

    let leagueRepository = LeagueRepository()

    func getLeague(forLeagueID id: Int, year: Int = 2021, completion: @escaping (League) -> Void) {
        leagueRepository.getLeague(with: id, year: year) { restLeague in
            var teams = [Team]()

            let jsonTeams = restLeague.standings[0]

            for team in jsonTeams {
                let newTeam = Team(logo: team.team.logo, name: team.team.name)
                teams.append(newTeam)
            }

            let newLeague = League(name: restLeague.name, logo: restLeague.logo, year: restLeague.season, teams: teams)
            completion(newLeague)
        }
    }
}
