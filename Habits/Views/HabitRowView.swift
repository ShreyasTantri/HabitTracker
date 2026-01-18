//
//  HabitRowView.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    let onToggle: () -> Void
    var body: some View {
        Button {
            onToggle()
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(habit.title)
                        .font(.headline)
                        .strikethrough(habit.isCompleted, color: .secondary)
                        .foregroundStyle(
                            habit.isCompleted ? .secondary: .primary
                        )
                    Text(habit.description ?? "")
                        .font(.subheadline)
                        .strikethrough(habit.isCompleted, color: .secondary)
                        .foregroundStyle(
                            habit.isCompleted ? .secondary: .primary
                        )
                }
                Spacer()
                if habit.isCompleted {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.green)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HabitRowView(habit: Habit(id: UUID(), title: "Drink Water",description: "3 Liters a day", isCompleted: true)) {
        print("Toggled")
    }
}
