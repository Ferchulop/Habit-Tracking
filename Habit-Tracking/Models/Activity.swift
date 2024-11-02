//
//  Activity.swift
//  Habit-Tracking1
//
//  Created by Fernando Jurado on 1/11/24.
//

import Foundation
// Identifible para permitir que cada instancia de Activity tenga un UUID.
// Codable para que Activity pueda ser codificada y decodificada.
// Equatable para comparar dos instancias de Activity y determinar si son iguales.
struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var place: String
    var completionCount: Int = 0
    
  static let example = Activity(name: "Example", description: "This is a test", place: "Example place")
}


