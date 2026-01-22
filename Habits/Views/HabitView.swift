//
//  HabitView.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import SwiftUI

struct HabitView: View {
    var viewModel: HabitsViewModel
    
    @State private var isAdding: Bool = false
    @State private var newHabitTitle: String = ""
    
    var body: some View {
        NavigationStack {
            Group {
                if isAdding {
                    addHabitInputView
                } else if viewModel.habits.isEmpty {
                    ContentUnavailableView("No Habits", systemImage: "list.bullet", description: Text("Tap + to add your first habit"))
                } else {
                    List {
                        ForEach(viewModel.habits) { habit in
                            HabitRowView(habit: habit) {
                                viewModel.toggle(habit)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAdding.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private var addHabitInputView: some View {
        HStack {
            TextField("Enter habit title", text: $newHabitTitle)
                .textFieldStyle(.roundedBorder)

            Button("Add") {
                viewModel.addHabit(title: newHabitTitle)
                newHabitTitle = ""
                isAdding = false
            }
            .disabled(newHabitTitle.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
        .background(.ultraThinMaterial)
    }
}

#Preview {
    HabitView(viewModel: HabitsViewModel())
}


/*

 App
  └── ContentView
       └── HabitView
            └── List
                 └── HabitRowView (many)
 
 */
