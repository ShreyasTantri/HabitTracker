//
//  ContentView.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = HabitsViewModel()

    var body: some View {
        TabView {
            Tab("Habits", systemImage: "repeat.circle.fill") {
                HabitView(viewModel: viewModel)
            }
            
            Tab("Dashboard", systemImage: "chart.bar.xaxis.ascending") {
                DashBoardView(viewModel: viewModel)
            }
            
            Tab("Settings", systemImage: "gearshape.fill") {
                SetttingsView()
            }
        }
    }
}

#Preview {
    ContentView()
}
