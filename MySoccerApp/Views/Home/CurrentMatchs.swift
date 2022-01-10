//
//  MatchOfTheDay.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import SwiftUI
import Kingfisher

struct CurrentMatchs: View {

    let viewModel: CurrentMatchsViewModel

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            HStack {
                Text(viewModel.match.homeTeam.name)
                    .font(.system(size: 15))
                    .foregroundColor(Color(red: 29/255, green: 88/255, blue: 143/255))
                    .fontWeight(.semibold)
                    .lineLimit(1)


                KFImage(URL(string: viewModel.match.homeTeam.logo))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                Spacer()
            }

            VStack {
                Text(viewModel.getHour())
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .padding(.bottom, 1)
                    .foregroundColor(.orange)

                Text(viewModel.getDate())
                    .font(.system(size: 13))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
            }

            HStack {
                Spacer()
                KFImage(URL(string: viewModel.match.awayTeam.logo))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)

                Text(viewModel.match.awayTeam.name)
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

    static let date = Date()
    
    static var previews: some View {
        CurrentMatchs(
            viewModel: CurrentMatchsViewModel(match: Match(homeTeam: teamOne, awayTeam: teamTwo, date: date, scoreHome: 1, scoreAway: 0, place: "Marcel Picot"))
        )
            .padding()
            .background(Color(red: 154/255, green: 164/255, blue: 179/255))
            .previewLayout(.sizeThatFits)
    }
}
