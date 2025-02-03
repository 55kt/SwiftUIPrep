//
//  LanguageSelectionView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 18/1/25.
//

import SwiftUI

struct LanguageSelectionView: View {
    // MARK: - Properties
    @Binding var currentLanguage: String
    @State private var isLoading: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    private let languages = [
        ("en", "English", "English"),
        ("ru", "Russian", "Русский")
    ]
    
    // MARK: - Body
    var body: some View {
        ZStack {
            List {
                Section(header: Text(LocalizedStringKey("INTERFACE LANGUAGE"))) {
                    ForEach(languages, id: \.0) { language in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(language.1)
                                .font(.headline)
                            Text(language.2)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }// VStack
                        .padding(.vertical, 6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            HStack {
                                Spacer()
                                if currentLanguage == language.0 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.accentColor)
                                }
                            }// HStack
                                .padding(.trailing, 8)
                        )// background
                        .contentShape(Rectangle())
                        .onTapGesture {
                            updateLanguage(to: language.0)
                        }
                    }// ForEach
                }// Section
            }// List
            .navigationBarBackButtonHidden(true) // Скрытие стандартной кнопки назад
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .disabled(isLoading)
            
            // Progress bar & background opacity
            if isLoading {
                Color.black.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                ProgressView("Updating language...")
                    .padding()
            }// if
            
        }// ZStack
    }// Body
    
    // MARK: - Functions
    private func updateLanguage(to languageCode: String) {
        guard currentLanguage != languageCode else { return }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            currentLanguage = languageCode
            isLoading = false
        }
        
    }// updateLanguage
}// View

// MARK: - Preview
#Preview {
    NavigationStack {
        LanguageSelectionView(currentLanguage: .constant(""))
    }
}
