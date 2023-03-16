//
//  Misc.swift
//  pomodoreSG
//
//  Created by MacBook Air on 08/03/23.
//

import Foundation

struct Misc {
    func currentDate() -> String {
        // get the current date and time
        let currentDateTime = Date()

        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long

        // get the date time String from the date object
        let format: String = formatter.string(from: currentDateTime) // October 8, 2016 at 10:48:53 PM
        return format
    }
}
