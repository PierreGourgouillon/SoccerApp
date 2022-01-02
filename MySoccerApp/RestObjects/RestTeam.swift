//
//  RestTeam.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 01/01/2022.
//

import Foundation

struct RestTeam: Codable {
    let rank: Int
    let team: RestInformationTeam
}

struct RestInformationTeam: Codable {
    let name: String
    let logo: String
}
