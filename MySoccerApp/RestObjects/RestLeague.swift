//
//  RestLeague.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 01/01/2022.
//

import Foundation

struct RestLeagueResponse: Codable {
    let response: [RestA]
}

struct RestA: Codable {
    let league: RestLeague
}

struct RestLeague: Codable {
    let name: String
    let logo: String
    let season: Int
    let standings: [[RestTeam]]
}
