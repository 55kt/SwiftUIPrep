//
//  LanguagePickerWheel.swift
//  SwiftUIPrep
//
//  Created by Vlad on 18/1/25.
//

import SwiftUI



struct LanguagePickerWheel: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var appLanguage: String = "en"
    private let languages = [
        ("🇺🇸", "en", "English"),
        ("🇷🇺", "ru", "Русский")
    ]
    @Binding var isSheetPresented: Bool // Передаем из SettingsView
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Select Language")
                .font(.headline)
                .padding(.top, 20)
            
            Picker("Language", selection: $appLanguage) {
                ForEach(languages, id: \.1) { language in
                    HStack {
                        Text(language.0) // Эмодзи флага
                        Text(language.2) // Название языка
                            .font(.headline)
                    }
                    .tag(language.1) // Код языка
                }
            }
            .pickerStyle(.wheel)
            .frame(height: 200)
            .clipped()
            .padding()
            
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    LanguagePickerWheel(isSheetPresented: .constant(true))
}
