//
//  LanguageItemView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 18/1/25.
//

import SwiftUI



struct LanguageItemView: View {
    // MARK: - Properties
    let flag: String
    let languageCode: String // Код языка, например "en" или "ru"
    let languageName: LocalizedStringKey // Название языка, например "English"
    
    @AppStorage("AppLanguage") private var appLanguage: String = "en" // Сохранение выбранного языка

    // MARK: - Body
    var body: some View {
        HStack(spacing: 15) {
            // Кружок с флагом
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 50, height: 50)
                Text(flag) // Эмодзи флага
                    .font(.largeTitle)
            }

            // Название языка
            Text(languageName)
                .font(.headline)
                .foregroundColor(.primary)

            Spacer()
        }
        .padding(.horizontal)
        .frame(height: 70)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(UIColor.systemGray6))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(appLanguage == languageCode ? Color.accent : Color.clear, lineWidth: 3)
                        .animation(.easeInOut(duration: 0.3), value: appLanguage == languageCode) // Анимация обводки
                )
        )
        .onTapGesture {
            withAnimation {
                appLanguage = languageCode // Обновляем выбранный язык
            }
        }
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 10) {
        LanguageItemView(flag: "🇺🇸", languageCode: "en", languageName: "English")
        LanguageItemView(flag: "🇷🇺", languageCode: "ru", languageName: "Русский")
    }
    .padding()
}
