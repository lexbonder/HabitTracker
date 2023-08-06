//
//  ActivityList.swift
//  HabitTracker
//
//  Created by Alex Bonder on 8/4/23.
//

import Foundation

class ActivityList: ObservableObject {
    @Published var activities: [Activity] {
        // When the list is changed
        didSet {
            // Attempt to encode the data
            if let encoded = try? JSONEncoder().encode(activities) {
                // Set the data into storage
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        // Attempt to retrieve data from user defaults
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            // Attempt to decode the data
            if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                // Set the data
                activities = decodedItems
                // Exit the function
                return
            }
        }
        
        activities = [Activity]()
    }
    
    func addActivity(_ activity: Activity) {
        activities.append(activity)
    }
}
