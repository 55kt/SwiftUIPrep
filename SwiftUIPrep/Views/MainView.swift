//
//  MainView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }// TabView
    }// Body
}// View

// MARK: - Preview
#Preview {
    MainView()
}
