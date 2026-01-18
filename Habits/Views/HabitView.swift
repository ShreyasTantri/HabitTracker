//
//  HabitView.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import SwiftUI

struct HabitView: View {
    let viewModel: HabitsViewModel = HabitsViewModel()
    var body: some View {
        List {
            ForEach(viewModel.habits) { habit in
                HabitRowView(habit: habit) {
                    viewModel.toggle(habit)
                }
            }
        }
    }
}

#Preview {
    HabitView()
}


/*

 App
  └── ContentView
       └── HabitView
            └── List
                 └── HabitRowView (many)
 
 */
