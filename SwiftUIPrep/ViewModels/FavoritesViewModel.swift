//
//  FavoritesViewModel.swift
//  SwiftUIPrep
//
//  Created by Vlad on 10/1/25.
//

import SwiftUI
import Combine

class FavoritesViewModel: ObservableObject {
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"

    @AppStorage("favoriteQuestions") private var favoriteQuestionsData: Data = Data()
    
    @Published var favoriteQuestions: [Question] = [] {
        didSet {
            saveFavorites()
        }
    }

    init() {
        loadFavorites()
    }

    func addToFavorites(_ question: Question) {
        if !favoriteQuestions.contains(where: { $0.id == question.id }) {
            favoriteQuestions.append(question)
        }
    }

    func removeFromFavorites(_ question: Question) {
        favoriteQuestions.removeAll { $0.id == question.id }
    }

    private func saveFavorites() {
        var allFavorites = loadAllFavorites()
        allFavorites[appLanguage] = favoriteQuestions
        guard let data = try? JSONEncoder().encode(allFavorites) else { return }
        favoriteQuestionsData = data
    }

    private func loadFavorites() {
        let allFavorites = loadAllFavorites()
        favoriteQuestions = allFavorites[appLanguage] ?? []
    }

    private func loadAllFavorites() -> [String: [Question]] {
        guard let allFavorites = try? JSONDecoder().decode([String: [Question]].self, from: favoriteQuestionsData) else {
            return [:]
        }
        return allFavorites
    }

    func updateLanguage(to newLanguage: String) {
        appLanguage = newLanguage
        loadFavorites()
    }
}
