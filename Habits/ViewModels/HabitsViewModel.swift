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
    
    var totalHabits: Int {
        habits.count
    }
    
    var completedHabits: Int {
        habits.filter { $0.isCompleted }.count
    }

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
