//
//  ContentView.swift
//  Habits
//
//  Created by CCS038 on 17/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Habits", systemImage: "repeat.circle.fill") {
                HabitView()
            }
            
            Tab("Dashboard", systemImage: "chart.bar.xaxis.ascending") {
                
            }
            
            Tab("Settings", systemImage: "gearshape.fill") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
