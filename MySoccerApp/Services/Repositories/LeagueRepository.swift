//
//  LeagueRepository.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import Foundation

class LeagueRepository {

    func getLeague(with id: Int, year: Int, completion: @escaping (RestLeague) -> Void) {
        let url = URL(string: "https://v3.football.api-sports.io/standings?league=\(id)&season=\(String(year))")!

        var request = URLRequest(url: url)
        request.addValue(API_KEY, forHTTPHeaderField: "x-rapidapi-key")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            let decoder = JSONDecoder()

            let restLeagueResponse = try! decoder.decode(RestLeagueResponse.self, from: data)
            completion(restLeagueResponse.response[0].league)
        }
        task.resume()
    }
}
