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
                        }
                        .padding(.vertical, 6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            HStack {
                                Spacer()
                                if currentLanguage == language.0 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.accentColor)
                                }
                            }
                                .padding(.trailing, 8)
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            updateLanguage(to: language.0)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .disabled(isLoading)
            
            // Прогресс-бар и затемнение
            if isLoading {
                Color.black.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                ProgressView("Updating language...")
                    .padding()
            }
        }
    }
    
    private func updateLanguage(to languageCode: String) {
        guard currentLanguage != languageCode else { return }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            currentLanguage = languageCode // Изменяем через @Binding
            isLoading = false
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        LanguageSelectionView(currentLanguage: .constant(""))
    }
}
