//
//  Activities.swift
//  Habit-Tracking1
//
//  Created by Fernando Jurado on 1/11/24.
//

import Foundation
// Uso el protocolo @Observable para monitorear los datos en caso de cambios.
@Observable
class Activities {
    var place = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(place) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    // Decodifico los datos guardados en UserDefaults y si la decodificacion es exitosa los asigno a activities
    init () {
        if let decoded = UserDefaults.standard.data(forKey: "activities") {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: decoded) {
                place = decodedActivities
                return
            }
        }
        place = []
    }
    
}

