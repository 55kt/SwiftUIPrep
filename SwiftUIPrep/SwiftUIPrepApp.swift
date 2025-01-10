//
//  SwiftUIPrepApp.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

@main
struct SwiftUIPrepApp: App {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @StateObject private var viewModel = QuestionViewModel()
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environmentObject(viewModel)
                .environmentObject(favoritesViewModel)
        }// WindowGroup
    }// Body
}// struct
