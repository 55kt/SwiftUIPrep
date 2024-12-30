//
//  SettingsView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var appLanguage: String = "en"
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            Text("Select your language")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
            
            LanguageButton(languageTitle: LocalizedStringKey("English"), backgroundColor: .blue) {
                appLanguage = "en"
            }
            
            LanguageButton(languageTitle: LocalizedStringKey("Russian"), backgroundColor: .red) {
                appLanguage = "ru"
            }
        }// VStack
        .padding()
    }// Body
    
    
}// View

// MARK: - Preview
#Preview {
    SettingsView()
}
