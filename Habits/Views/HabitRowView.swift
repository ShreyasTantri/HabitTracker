//
//  HabitRowView.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    var body: some View {
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
}

#Preview {
    HabitRowView(habit: Habit(id: UUID(), title: "Drink Water",description: "3 Liters a day", isCompleted: true))
}
