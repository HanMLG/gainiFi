//
//  ContentView.swift
//  gainiFi
//
//  Created by Anderson Sprenger on 19/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill") // Suitable for Home
                    Text("Home")
                }
            
            Text("Debit Planning") // here we plan how to organize our debit
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "calendar.badge.plus") // Represents financial transactions
                    Text("Debit Planning")
                }
            
            Text("Goals") // here theres some gamification stuff about the finantial planning
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "rosette") // Target icon for goals
                    Text("Goals")
                }
        }
    }
}

#Preview {
    ContentView()
}
