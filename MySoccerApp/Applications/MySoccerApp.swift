//
//  MySoccerAppApp.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import SwiftUI

@main
struct MySoccerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: HomeViewModel(
                leagueInteractor: DefaultLeagueInteractor(apiCaller: DefaultAPICaller(), requestGenerator: DefaultRequestGenerator()),
                matchInteractor: DefaultMatchInteractor(apiCaller: DefaultAPICaller(), requestGenerator: DefaultRequestGenerator())
                )
            )
        }
    }
}
