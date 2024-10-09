//
//  ContentView.swift
//  MathGame
//
//  Created by Denidu Gamage on 2024-10-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Label("Guess", systemImage: "checkmark.circle.badge.questionmark.fill") }
            
            
            SettingsView().tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
