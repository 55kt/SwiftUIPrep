//
//  QuestionsListView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 9/1/25.
//

import SwiftUI
import TipKit

struct QuestionsListView: View {
    // MARK: - Properties
    let filteredQuestions: [Question]
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(filteredQuestions) { question in
                NavigationLink(destination: QuestionDetailView(question: question)) {
                    QuestionListItemView(question: question)
                }// NavigationLink
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button(action: {
                        withAnimation {
                            favoritesViewModel.addToFavorites(question)
                        }
                        print("Added to favorites: \(question.question)")
                    }) {
                        Label("Favorite", systemImage: "star.fill")
                    }
                    .tint(.yellow)
                }// swipeActions
            }// ForEach
        }// List
        .listStyle(PlainListStyle())
    }// Body
}// View

// MARK: - Preview
#Preview {
    QuestionsListView(filteredQuestions: [1, 2, 3].map { Question.previewFromJSON(index: $0, language: "ru") })
        .environmentObject(FavoritesViewModel())
}
