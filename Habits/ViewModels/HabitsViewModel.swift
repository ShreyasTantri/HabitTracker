//
//  HabitsViewModel.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import Foundation
import SwiftUI

enum HabitViewState {
    case list
    case empty
}

@Observable
@MainActor
final class HabitsViewModel {
    private let habitsKey = "habits_key"
    
    var habits : [Habit] = [] {
        didSet {
            saveHabits()
        }
    }
    
    init() {
        loadHabits()
    }
    
    var totalHabits: Int {
        habits.count
    }
    
    var completedHabits: Int {
        habits.filter { $0.isCompleted }.count
    }
    
    var viewState: HabitViewState {
        habits.isEmpty ? .empty : .list
    }

    func toggle(_ habit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == habit.id }) else {
            return
        }
        habits[index].isCompleted.toggle()
    }
    
    func addHabit(habit: Habit) {
        habits.append(habit)
    }
    
    // Save
    func saveHabits() {
        guard let data = try? JSONEncoder().encode(habits) else {
            return
        }
        UserDefaults.standard.set(data, forKey: habitsKey)
    }
    
    // Load
    func loadHabits() {
        guard let data = UserDefaults.standard.data(forKey: habitsKey),
              let decoded = try? JSONDecoder().decode([Habit].self, from: data) else {
            return
        }
        habits = decoded
    }
}
