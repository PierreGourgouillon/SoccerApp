//
//  APIResponse.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 06/01/2022.
//

import Foundation

struct APIResponse<T:Decodable> : Decodable {
    let response: [T]
}
