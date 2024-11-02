//
//  ContentView.swift
//  Habit-Tracking1
//
//  Created by Fernando Jurado on 1/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    @State private var isPresentingDetail = false
    var indoorActivities: [Activity] {data.place.filter { $0.place == "Indoor"}}
    var outdoorActivities: [Activity] {data.place.filter { $0.place == "Outdoor"}}
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Indoor Activities")) {
                    ForEach(indoorActivities) { activity in
                        NavigationLink {
                            ActivityCountView(activity: activity, data: data)
                        }label: {
                            HStack {
                                Text(activity.name)
                                
                                Spacer()
                                
                                Text(String(activity.completionCount))
                                    .font(.caption.weight(.black))
                                    .padding(5)
                                    .frame(minWidth: 40)
                                    .background(color(for: activity))
                                    .clipShape(.capsule)

                            }
                            
                        }
                        
                    }
                    .onDelete { offsets in
                        deletePersonalActivity(at: offsets, from: indoorActivities)
                    }
                    
                }
                Section(header: Text("Outdoor Activities")) {
                    ForEach(outdoorActivities) { activity in
                        NavigationLink {
                            
                            ActivityCountView(activity: activity, data: data)
                        }label: {
                            HStack {
                                Text(activity.name)
                                
                                Spacer()
                                
                                Text(String(activity.completionCount))
                                    .font(.caption.weight(.black))
                                    .padding(5)
                                    .frame(minWidth: 40)
                                    .background(color(for: activity))
                                    .clipShape(.capsule)
                            }
                        }
                        
                    }
                    .onDelete { offsets in
                        deletePersonalActivity(at: offsets, from: outdoorActivities)
                    }
                    
                }
                
            }
            
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button("Add activity", systemImage: "plus") {
                    isPresentingDetail = true
                    
                }
                
            }
            .sheet(isPresented: $isPresentingDetail) {
                ActivityView(activities: data)
                
            }
            
        }
        
    }
    func deleteActivity(at offsets: IndexSet) {
        data.place.remove(atOffsets: offsets)
    }
    func deletePersonalActivity( at offsets: IndexSet, from filteredActivities: [Activity]) {
        for index in offsets {
            if let activityIndex = data.place.firstIndex(of: filteredActivities[index]) {
                data.place.remove(at: activityIndex)
            }
        }
       
            }
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
              .red
        } else if activity.completionCount < 10 {
             .orange
        } else if activity.completionCount < 20 {
             .yellow
        } else if activity.completionCount < 30 {
              .green
        } else {
              .blue
        }
        
    }
    
}

#Preview {
    ContentView()
}
