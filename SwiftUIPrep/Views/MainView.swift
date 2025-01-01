//
//  MainView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    
    // MARK: - Body
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            TestsView()
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("Tests")
                }
            
            ProgressView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                    Text("Progress")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }// TabView
        .environment(\.locale, .init(identifier: appLanguage))
    }// Body
}// View

// MARK: - Preview
#Preview {
    MainView()
}
