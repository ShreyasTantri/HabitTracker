//
//  Habit.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import Foundation

struct Habit: Identifiable {
    var id: UUID
    var title: String
    var description: String?
    var isCompleted: Bool
}
