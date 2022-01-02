//
//  League.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import Foundation

struct League: Identifiable {
    let id = UUID().uuidString
    let name: String
    let logo : String
    let year: Int
    let teams: [Team]
}
