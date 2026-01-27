//
//  SetttingsView.swift
//  Habits
//
//  Created by Sree Sai Raghava Dandu on 24/01/26.
//

import SwiftUI

struct SetttingsView: View {
    @State private var isShowingAddSheet = false
    @State private var habit: Habit?
    var body: some View {
        NavigationStack {
            Button("Add A New Habit") {
                isShowingAddSheet = true
            }
            
            if let habit {
                HabitRowView(habit: habit)
            }
        }
        .sheet(isPresented: $isShowingAddSheet) {
            AddHabitView { newHabit in
                habit = newHabit
            }
        }
    }
}

#Preview {
    SetttingsView()
}
