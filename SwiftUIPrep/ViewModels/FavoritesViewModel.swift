//
//  FavoritesViewModel.swift
//  SwiftUIPrep
//
//  Created by Vlad on 10/1/25.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    @Published var favoriteQuestions: [Question] {
        didSet {
            saveFavorites()
        }
    }
    
    @AppStorage("favoriteQuestions") private var favoriteQuestionsData: Data = Data()
    
    init() {
        favoriteQuestions = []
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
        guard let data = try? JSONEncoder().encode(favoriteQuestions) else { return }
        favoriteQuestionsData = data
    }
    
    private func loadFavorites() {
        guard let questions = try? JSONDecoder().decode([Question].self, from: favoriteQuestionsData) else { return }
        favoriteQuestions = questions
    }
}
