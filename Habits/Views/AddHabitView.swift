//
//  AddHabitView.swift
//  Habits
//
//  Created by Sree Sai Raghava Dandu on 24/01/26.
//

import SwiftUI

struct AddHabitView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var description: String = ""

    let onAdd: (Habit) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("e.g. Morning Walk", text: $title)
                }

                Section("Description") {
                    TextField("Optional description", text: $description)
                }
            }
            .navigationTitle("New Habit")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        let habit = Habit(
                            id: UUID(),
                            title: title,
                            description: description.isEmpty ? nil : description,
                            isCompleted: false
                        )
                        onAdd(habit)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}


#Preview {
    AddHabitView { habit in }
}
