//
//  MatchOfTheDay.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import SwiftUI
import Kingfisher

struct CurrentMatchs: View {

    let match: Match

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            HStack {
                Text(match.homeTeam.name)
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 29/255, green: 88/255, blue: 143/255))
                    .fontWeight(.semibold)
                    .lineLimit(1)


                KFImage(URL(string: match.homeTeam.logo))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
            }

            VStack {
                Text(match.hour)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.bottom, 1)
                    .foregroundColor(.orange)

                Text(match.date)
                    .font(.system(size: 13))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }

            HStack {
                KFImage(URL(string: match.outSideTeam.logo))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)

                Text(match.outSideTeam.name)
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red: 29/255, green: 88/255, blue: 143/255))
                    .lineLimit(1)
            }
            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}

struct MatchOfTheDay_Previews: PreviewProvider {
    static let teamOne = Team(logo: "https://media.api-sports.io/football/teams/40.png", name: "Liverpool")
    static let teamTwo = Team(logo: "https://media.api-sports.io/football/teams/41.png", name: "Southampton")

    
    static var previews: some View {
        CurrentMatchs(
            match: Match(homeTeam: teamOne, outSideTeam: teamTwo, date: "30 OCT", hour: "06:04")
        )
            .padding()
            .background(Color(red: 154/255, green: 164/255, blue: 179/255))
            .previewLayout(.sizeThatFits)
    }
}
