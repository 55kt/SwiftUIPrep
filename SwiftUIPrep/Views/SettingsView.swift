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
        NavigationStack {
            VStack(spacing: 20) {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                    .padding(.top, 40)
                
                // Language Section
                VStack(spacing: 10) {
                    Text("Language")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.leading, 20)
                    
                    HStack(spacing: 15) {
                        LanguageCard(language: "English", isSelected: appLanguage == "en", color: .blue) {
                            appLanguage = "en"
                        }
                        
                        LanguageCard(language: "Russian", isSelected: appLanguage == "ru", color: .red) {
                            appLanguage = "ru"
                        }
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
    }
}

// MARK: - Language Card Component
struct LanguageCard: View {
    let language: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 10) {
                Text(language)
                    .font(.headline)
                    .foregroundColor(isSelected ? .white : color)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(isSelected ? color : Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(color, lineWidth: 2)
                            )
                    )
            }
        }
    }
}

// MARK: - Preview
#Preview {
    SettingsView()
}
