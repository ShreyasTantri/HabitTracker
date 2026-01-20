//
//  HabitsViewModel.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import Foundation
import SwiftUI

@Observable
@MainActor
final class HabitsViewModel {
    
    var habits : [Habit] = []

    func toggle(_ habit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == habit.id }) else {
            return
        }
        habits[index].isCompleted.toggle()
    }
    
    func addHabit(title: String) {
        let newHabit = Habit(id: UUID(), title: title, description: nil, isCompleted: false)
        
        habits.append(newHabit)
    }
}



/*
 Changes - previously this was hardcoded
var habits : [Habit] = [
    Habit(id: UUID(), title: "Drink Water Daily", description: "3 Liters a day should help you", isCompleted: false),
    Habit(id: UUID(), title: "Exercise Regularly", description: "30 minutes a day is enough", isCompleted: false),
    Habit(id: UUID(), title: "Read Daily", description: "1 Book a week is a good goal", isCompleted: true)
]
*/
