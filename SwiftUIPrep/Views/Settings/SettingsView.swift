//
//  SettingsView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Language Section
                    VStack(spacing: 10) {
                        Text("Language")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.leading, 20)
                        
                        // Language Options
                        VStack(spacing: 10) {
                            LanguageItemView(flag: "🇺🇸", languageCode: "en", languageName: "English")
                            LanguageItemView(flag: "🇷🇺", languageCode: "ru", languageName: "Russian")
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(UIColor.systemGray6))
                    )
                    .padding(.horizontal)
                    
                    Spacer()
                }// VStack
                .padding()
            }
            .navigationTitle("Settings")
        }
    }
}

// MARK: - Preview
#Preview {
    SettingsView()
}
