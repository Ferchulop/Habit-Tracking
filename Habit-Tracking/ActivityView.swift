//
//  ActivityView.swift
//  Habit-Tracking
//
//  Created by Fernando Jurado on 28/10/24.
//

import SwiftUI

struct ActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var place = "Indoor"
    @State private var description = ""
    let places = ["Indoor", "Outdoor"]
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                Picker("Place", selection: $place) {
                    ForEach(places, id: \.self) {
                        Text($0)
                    }
                }
                    
                
                
            }
            .navigationTitle("Add new activity")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let activity = Activity(name: name, description: description, place: place)
                        activities.place.append(activity)
                        dismiss()
                        
                        
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                    
                }
            }
        }
        
        
    }
}

#Preview {
    ActivityView(activities: Activities())
}
