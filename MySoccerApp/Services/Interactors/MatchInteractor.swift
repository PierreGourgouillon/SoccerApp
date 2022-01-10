//
//  MatchInteractor.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 09/01/2022.
//

import Foundation

class MatchInteractor {

    private var apiCaller: APICaller
    private var requestGenerator: RequestGenerator

    init(apiCaller: APICaller, requestGenerator: RequestGenerator) {
        self.apiCaller = apiCaller
        self.requestGenerator = requestGenerator
    }

    func matchOfTheWeek(withLeagueId leagueId: Int) async throws -> [Match] {
        do {
            let currenDate = formatDate(date: Date())
            let nextWeek = formatDate(date: Date().get(direction: .next, dayName: .saturday))
            let currentYear = Date().getYear() - 1

            let url = try requestGenerator.generateRequest(endpoint: .matchs, method: .GET,
                                                           queryParameters: ["season":String(currentYear),
                                                                             "league":String(leagueId),
                                                                             "from": currenDate,
                                                                             "to": nextWeek])

            let response = try await apiCaller.call(url, decodedType: RestResponseMatch.self)

            if (response.isEmpty) {
                throw APICallerError.internalServerError
            }

            var matchs = [Match]()

            for restMatch in response {
                let match = ModelFormator.formatRestMatch(rest: restMatch)
                matchs.append(match)
            }

            return matchs
            
        }catch {
            throw APICallerError.internalServerError
        }
    }

    private func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
