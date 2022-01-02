//
//  ButtonFilterLeague.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 31/12/2021.
//

import SwiftUI
import Kingfisher

struct ButtonFilterLeague: View {

    let logo: String
    let title: String
    @State var isClicked: Bool = false

    var body: some View {
        Button(action: {
            isClicked.toggle()
        }) {
            HStack {
                KFImage(URL(string: logo))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .clipped()
                Text(title)
                    .foregroundColor(
                        isClicked ?
                            .white :
                            Color(red: 102/255, green: 117/255, blue: 139/255)
                    )
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
            }
            .padding(5)
            .padding(.horizontal)
            .background(
                isClicked ?
                    Color(red: 227/255, green: 49/255, blue: 81/255, opacity: 0.95) :
                    .white)
            .cornerRadius(100)
        }
    }
}

struct ButtonFilterLeague_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFilterLeague(
            logo: "https://media.api-sports.io/football/leagues/61.png",
            title: "Premier League"
        )
            .padding()
            .background(Color(red: 154/255, green: 164/255, blue: 179/255))
            .previewLayout(.sizeThatFits)
    }
}
