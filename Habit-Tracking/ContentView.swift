//
//  ContentView.swift
//  Habit-Tracking
//
//  Created by Fernando Jurado on 27/10/24.
//

import SwiftUI
struct Activity: Identifiable, Codable, Equatable {
    let id = UUID()
    let name: String
    let description: String
    let isCompleted: Bool
}
// Uso el protocolo @Observable para monitorear los datos en caso de cambios.
@Observable
class Activities {
    
    
}
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
