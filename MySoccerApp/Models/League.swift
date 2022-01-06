//
//  League.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import Foundation

struct APIResponse: Codable {
    let response: [ResponseLeague]
}

struct ResponseLeague: Codable {
    let league: League
}

struct League: Identifiable, Codable {
    let id: Int
    let name: String
    let logo: String
    let season: Int
    let standings: [Standing]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logo
        case season
        case standings
    }

    init(id: Int, name: String, logo: String, season: Int, standings: [Standing]) {
        self.id = id
        self.name = name
        self.logo = logo
        self.season = season
        self.standings = standings
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        logo = try container.decode(String.self, forKey: .logo)
        season = try container.decode(Int.self, forKey: .season)
        let standings = try container.decode([[Standing]].self, forKey: .standings)

        if let array = standings.first {
            self.standings = array
        }else {
            self.standings = []
        }
    }
}

struct Standing: Codable {
    let rank: Int
    let team: Team
    let form: String
}
