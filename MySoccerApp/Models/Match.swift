//
//  Match.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import Foundation

struct Match: Identifiable {
    let id = UUID().uuidString
    let homeTeam: Team
    let outSideTeam: Team
    let date: String
    let hour: String
}
