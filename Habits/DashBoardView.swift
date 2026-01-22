//
//  DashBoardView.swift
//  Habits
//
//  Created by CCS038 on 22/01/26.
//

import SwiftUI

struct DashBoardView: View {
    var viewModel: HabitsViewModel
    var body: some View {
        VStack {
            Text("Dashboard")
                .font(.largeTitle)
            
            completionCard
        }
        .padding()
        .background(.secondary)
        .cornerRadius(20)
    }
    
    private var completionCard: some View {
        VStack {
            Text("Habits Completed")
                .font(.headline)
            
            Text("\(viewModel.completedHabits) / \(viewModel.totalHabits)")
                .font(.system(size: 36, weight: .bold))
            
            Text("completed")
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

#Preview {
    DashBoardView(viewModel: HabitsViewModel())
}
