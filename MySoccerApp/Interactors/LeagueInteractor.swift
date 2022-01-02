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

            for team in restLeague.standings[0] {
                let newTeam = Team(logo: team.team.logo, name: team.team.name)
                teams.append(newTeam)
            }

            let newLeague = League(name: restLeague.name, logo: restLeague.logo, year: restLeague.season, teams: teams)
            completion(newLeague)
        }
    }
}
