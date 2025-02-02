//
//  LanguageManager.swift
//  SwiftUIPrep
//
//  Created by Vlad on 2/2/25.
//

import SwiftUI
import Combine

class LanguageManager: ObservableObject {
    static let shared = LanguageManager()
    
    @Published var currentLanguage: String = UserDefaults.standard.string(forKey: "AppLanguage") ?? "en" {
        didSet {
            UserDefaults.standard.set(currentLanguage, forKey: "AppLanguage")
        }
    }
}
