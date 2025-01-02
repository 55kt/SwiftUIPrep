//
//  QuestionViewModel.swift
//  SwiftUIPrep
//
//  Created by Vlad on 2/1/25.
//

import Foundation
import Combine
import SwiftUI


final class QuestionViewModel: ObservableObject {
    @Published var questions: [Question] = []
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en" {
        didSet {
            loadQuestions()
        }
    }

    init() {
        loadQuestions()
    }

    func loadQuestions() {
        print("🟢 Loading questions for language: \(appLanguage)")
        questions = JSONLoader.loadQuestions(for: appLanguage)
    }
}
