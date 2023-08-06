//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Alex Bonder on 8/4/23.
//

import SwiftUI

struct ActivityView: View {
    @Binding var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.name)
                .padding([.horizontal, .bottom])
                .font(.largeTitle)
            Text(activity.description)
                .padding([.horizontal, .bottom])
            Text("Times Completed: \(activity.timesCompleted)")
                .padding(.horizontal)
            List {
                ForEach(activity.datesCompleted, id: \.self) { date in
                    Text(date)
                }
                .onDelete(perform: removeRows)
            }
        }
        .toolbar {
            Button {
                activity.completeActivity()
            } label: {
                Text("Task Complete!")
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        activity.datesCompleted.remove(atOffsets: offsets)
    }
}

struct ActivityView_Previews: PreviewProvider {
    @State static var activity = Activity(name: "Code", description: "Hacking with swift")
    static var previews: some View {
        ActivityView(activity: $activity)
    }
}
