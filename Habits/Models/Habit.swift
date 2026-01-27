//
//  Habit.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var description: String?
    var isCompleted: Bool
}
