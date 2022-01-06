//
//  LeagueInteractor.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 01/01/2022.
//

import Foundation

class LeagueInteractor {

    private var apiCaller: APICaller
    private var requestGenerator: RequestGenerator

    init() {
        self.apiCaller = DefaultAPICaller()
        self.requestGenerator = DefaultRequestGenerator()
    }

    func getLeague(with idLeague: Int, season: Int = 2021) async throws -> [ResponseLeague] {
        do {
            let url = try requestGenerator.generateRequest(endpoint: .leagues, method: .GET,
                                                           queryParameters: ["season":String(season),"league":String(idLeague)])
            let response = try await apiCaller.call(url, decodedType: ResponseLeague.self)
            return response
        }catch {
            throw APICallerError.internalServerError
        }
    }
}
