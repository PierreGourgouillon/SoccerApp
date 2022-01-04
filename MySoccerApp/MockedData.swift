//
//  MockedData.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 02/01/2022.
//

import Foundation

let teamOne = Team(logo: "https://media.api-sports.io/football/teams/40.png", name: "Liverpool")
let teamTwo = Team(logo: "https://media.api-sports.io/football/teams/41.png", name: "Southampton")

let mockedLeagues = [
    League(name: "Ligue 1", logo: "https://media.api-sports.io/football/leagues/61.png", year: 2021, teams: [teamOne, teamTwo]),
    League(name: "Ligue 2", logo: "https://media.api-sports.io/football/leagues/62.png", year: 2021, teams: [teamOne, teamTwo]),
    League(name: "National", logo: "https://media.api-sports.io/football/leagues/63.png", year: 2021, teams: [teamOne, teamTwo])
]
