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

    init(apiCaller: APICaller, requestGenerator: RequestGenerator) {
        self.apiCaller = apiCaller
        self.requestGenerator = requestGenerator
    }

    func getLeague(with idLeague: Int, season: Int = Date().getYear() - 1) async throws -> League {
        do {
            let url = try requestGenerator.generateRequest(endpoint: .leagues, method: .GET,
                                                           queryParameters: ["season":String(season),"league":String(idLeague)])
            let response = try await apiCaller.call(url, decodedType: ResponseLeague.self)

            if !(response.isEmpty) {
                return response[0].league
            }
            
            throw APICallerError.internalServerError
        }catch {
            throw APICallerError.internalServerError
        }
    }
}
