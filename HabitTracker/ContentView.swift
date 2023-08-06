//
//  ContentView.swift
//  HabitTracker
//
//  Created by Alex Bonder on 8/4/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activityList = ActivityList()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List($activityList.activities) { $activity in
                NavigationLink {
                    ActivityView(activity: $activity)
                } label: {
                    Text("\(activity.name) - done \(activity.timesCompleted) time\(activity.timesCompleted != 1 ? "s" : "")")
                }

            }
            .navigationBarTitle("Habit Tracker")
            .toolbar {
                Button {
                    showingAddActivity.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivity(activityList: activityList)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
