//
//  HabitView.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import SwiftUI

struct HabitView: View {
    var viewModel: HabitsViewModel
    @State private var isShowingAddSheet = false

    var body: some View {
        NavigationStack {
            content
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddSheet) {
                AddHabitView { habit in
                    viewModel.addHabit(habit: habit)
                }
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.viewState {
        case .list:
            List {
                ForEach(viewModel.habits) { habit in
                    HabitRowView(habit: habit)
                    .swipeActions(edge: .trailing) {
                        Button {
                            viewModel.toggle(habit)
                        } label: {
                            Label(
                                habit.isCompleted ? "Undo" : "Complete",
                                systemImage: habit.isCompleted ? "arrow.uturn.left" : "checkmark"
                            )
                        }
                        .tint(habit.isCompleted ? .orange : .green)
                    }
                }
            }
        case .empty:
            ContentUnavailableView(
                "No Habits",
                systemImage: "list.bullet",
                description: Text("Tap + to add your first habit")
            )
        }
    }
}

#Preview {
    HabitView(viewModel: HabitsViewModel())
}
