//
//  HomeView.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import SwiftUI

struct HomeView: View {

   @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.leagues) { league in
                            ButtonFilterLeague(logo: league.logo, title: league.name)
                        }
                    }.padding(.horizontal)
                }

                VStack {
                    HStack {
                        Text("Matchs")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 102/255, green: 117/255, blue: 139/255))
                        Spacer()
                        Text("See all")
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                    .padding(.vertical)

//                    ForEach(viewModel.matchs) { match in
//                        CurrentMatchs(match: match)
//                            .padding(.top, 10)
//                    }

                }.padding(.horizontal)
            }
            .background(Color(red: 242/255, green: 241/255, blue: 243/255))
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            Task {
                try await viewModel.getLeague()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
