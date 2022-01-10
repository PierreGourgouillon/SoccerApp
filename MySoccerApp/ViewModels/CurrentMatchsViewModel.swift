//
//  CurrentMatchsViewModel.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 10/01/2022.
//

import Foundation

class CurrentMatchsViewModel {

    let match: Match

    init(match: Match) {
        self.match = match
    }

    func getHour() -> String {
        let hour = Calendar.current.component(.hour, from: match.date)
        var minutes = Calendar.current.component(.minute, from: match.date)


        if (minutes == 0) {
            return String(hour) + ":" + String(minutes) + String(minutes)
        }

        if (minutes < 10) {
            minutes *= 10
        }

        return String(hour) + ":" + String(minutes)
    }

    func getDate() -> String {
        let day = Calendar.current.component(.day, from: match.date)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return String(day) + " " + dateFormatter.string(from: match.date).uppercased()
    }
}
