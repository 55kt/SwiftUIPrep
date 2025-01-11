//
//  QuestionsListView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 9/1/25.
//

import SwiftUI

struct QuestionsListView: View {
    // MARK: - Properties
    let filteredQuestions: [Question]
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    // MARK: - Body
    var body: some View {
        List {
            CoverImageView()
                .frame(height: 300)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(filteredQuestions) { question in
                NavigationLink(destination: QuestionDetailView(question: question)) {
                    QuestionListItemView(question: question)
                }// NavigationLink
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
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
