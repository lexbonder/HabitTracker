//
//  AddActivityScreen.swift
//  HabitTracker
//
//  Created by Alex Bonder on 8/4/23.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var activityList: ActivityList
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var alreadyComplete = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Details", text: $description)
                Toggle(isOn: $alreadyComplete) {
                    Text("First time done?")
                }
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    var activity = Activity(name: name, description: description)
                    if (alreadyComplete) {
                        activity.completeActivity()
                    }
                    activityList.addActivity(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddActivityScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(activityList: ActivityList())
    }
}
