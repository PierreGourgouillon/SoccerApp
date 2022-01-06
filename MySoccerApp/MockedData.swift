//
//  MockedData.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 02/01/2022.
//

import Foundation

let teamOne = Team(name: "Liverpool", logo: "https://media.api-sports.io/football/teams/40.png")
let teamTwo = Team(name: "Southampton", logo: "https://media.api-sports.io/football/teams/41.png")

let standingOne = Standing(rank: 1, team: teamOne, form: "WWWWL")
let standingTwo = Standing(rank: 2, team: teamTwo, form: "LLLWW")

let mockedLeagues = [
    League(id: 1, name: "Ligue 1", logo: "https://media.api-sports.io/football/leagues/61.png", season: 2021, standings: [standingOne, standingTwo]),
    League(id: 1, name: "Ligue 2", logo: "https://media.api-sports.io/football/leagues/62.png", season: 2021, standings: [standingOne, standingTwo]),
    League(id: 1, name: "National", logo: "https://media.api-sports.io/football/leagues/63.png", season: 2021, standings: [standingOne, standingTwo]),
]
