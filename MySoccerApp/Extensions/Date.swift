//
//  Date.swift
//  MySoccerApp
//
//  Created by Pierre Gourgouillon on 10/01/2022.
//

import Foundation

extension Date {

    enum WeekDay: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }

    enum SearchDirection {
        case next
        case previous

        var calendarOptions: NSCalendar.Options {
            switch self {
            case .next:
                return .matchNextTime
            case .previous:
                return [.searchBackwards, .matchNextTime]
            }
        }
    }

    func get(direction: SearchDirection, dayName: WeekDay, considerToday consider: Bool = false) -> Date {

        let nextWeekDayIndex = dayName.rawValue
        let today = self
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!

        if consider && calendar.component(.weekday, from: today as Date) == nextWeekDayIndex {
            return today
        }

        var nextDateComponent = DateComponents()
        nextDateComponent.weekday = nextWeekDayIndex

        let date = calendar.nextDate(after: today, matching: nextDateComponent, options: direction.calendarOptions)!
        return date
    }

    func getYear() -> Int {
        return Calendar.current.component(.year, from: self)
    }

    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
