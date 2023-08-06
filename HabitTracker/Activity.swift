//
//  Activity.swift
//  HabitTracker
//
//  Created by Alex Bonder on 8/4/23.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    var datesCompleted = [String]()

    var timesCompleted: Int {
        datesCompleted.count
    }
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    mutating func completeActivity() {
        datesCompleted.append(Date.now.formatted(date: .abbreviated, time: .shortened))
    }
}
