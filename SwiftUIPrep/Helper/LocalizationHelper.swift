//
//  LocalizationHelper.swift
//  SwiftUIPrep
//
//  Created by Vlad on 2/2/25.
//

import Foundation
import SwiftUI

struct NavigationTitleHelper {
    static func updateTitle(for language: String, key: String, binding: Binding<String>) {
        binding.wrappedValue = LocalizationHelper.getLocalizedString(for: key, language: language)
    }
}

struct LocalizationHelper {
    static let navigationTitles: [String: [String: String]] = [
        "settings": [
            "en": "Settings",
            "ru": "Настройки"
        ],
        "favorites": [
            "en": "Favorites",
            "ru": "Избранное"
        ],
        "progress": [
            "en": "Progress",
            "ru": "Прогрес"
        ],
        "swiftuiprep": [
            "en": "SwiftUIPrep",
            "ru": "SwiftUIPrep"
        ],
        "categories": [
            "en": "Categories",
            "ru": "Категории"
        ]
    ]
    
    static func getLocalizedString(for key: String, language: String) -> String {
        return navigationTitles[key]?[language] ?? navigationTitles[key]?["en"] ?? key
    }
}

enum SupportedLanguage: String, CaseIterable {
    case english = "en"
    case russian = "ru"
    case spanish = "es"
    case french = "fr"
    case german = "de"
    case italian = "it"
    // Добавьте остальные языки

    var displayName: String {
        switch self {
        case .english: return "English"
        case .russian: return "Русский"
        case .spanish: return "Español"
        case .french: return "Français"
        case .german: return "Deutsch"
        case .italian: return "Italiano"
        }
    }
}
