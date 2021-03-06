//
//  Match.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import Foundation

struct Match: Identifiable, Decodable {
    var id = UUID().uuidString
    let homeTeam: Team
    let awayTeam: Team
    let date: String
    let hour: String
}
