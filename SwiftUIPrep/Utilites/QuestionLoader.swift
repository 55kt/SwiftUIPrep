//
//  QuestionLoader.swift
//  SwiftUIPrep
//
//  Created by Vlad on 2/1/25.
//

import Foundation

struct QuestionLoader {
    static func loadQuestions(for language: String) -> [Question] {
        let fileName = "questions_\(language).json"
        print("🟢 Trying to load: \(fileName)")
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            print("❌ JSON file not found: \(fileName)")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let questions = try JSONDecoder().decode([Question].self, from: data)
            print("🟢 Successfully loaded \(questions.count) questions from \(fileName)")
            return questions
        } catch {
            print("❌ Error decoding JSON: \(error.localizedDescription)")
            return []
        }
    }
}
