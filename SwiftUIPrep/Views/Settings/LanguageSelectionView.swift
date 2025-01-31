//
//  LanguageSelectionView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 18/1/25.
//

import SwiftUI

struct LanguageSelectionView: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var appLanguage: String = "en"
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
                                if appLanguage == language.0 {
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
    
    // MARK: - Methods
    private func updateLanguage(to languageCode: String) {
        guard appLanguage != languageCode else { return } // Не выполнять, если язык не меняется
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            appLanguage = languageCode
            // Здесь можно добавить дополнительную логику, например, обновление UI
            isLoading = false
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        LanguageSelectionView()
    }
}
