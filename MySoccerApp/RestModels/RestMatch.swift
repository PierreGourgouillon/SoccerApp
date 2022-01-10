//
//  RestMatch.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 10/01/2022.
//

import Foundation

struct RestResponseMatch: Codable {
    let fixture: RestFixture
    let teams: RestTeams
    let score: RestScore
}

struct RestFixture: Codable {
    let date: String
    let timestamp: Int
    let venue: RestPlace
}

struct RestPlace: Codable {
    let name: String
}

struct RestTeams: Codable {
    let home: RestTeam
    let away: RestTeam
}

struct RestTeam: Codable {
    let name: String
    let logo: String
//    let winner: Bool?
}

struct RestScore: Codable {
    let fulltime: RestScoreFullTime
}

struct RestScoreFullTime: Codable {
    let home: Int?
    let away: Int?
}
