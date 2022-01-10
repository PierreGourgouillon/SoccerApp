//
//  FormatorModel.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 10/01/2022.
//

import Foundation

class ModelFormator {

    static func formatRestMatch(rest: RestResponseMatch) -> Match {
        let homeTeam = Team(name: rest.teams.home.name, logo: rest.teams.home.logo)
        let awayTeam = Team(name: rest.teams.away.name, logo: rest.teams.away.logo)
        let scoreHome = rest.score.fulltime.home
        let scoreAway = rest.score.fulltime.away
        let place = rest.fixture.venue.name
        let date = strToDate(str: rest.fixture.date) ?? Date()

        return Match(homeTeam: homeTeam, awayTeam: awayTeam, date: date, scoreHome: scoreHome, scoreAway: scoreAway, place: place)
    }

    static private func strToDate(str: String) -> Date? {
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: str)
    }
}
