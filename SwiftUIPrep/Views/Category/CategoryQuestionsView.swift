//
//  CategoryQuestionsView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 9/1/25.
//

import SwiftUI

struct CategoryQuestionsView: View {
    // MARK: - Properties
    let category: String
    let questions: [Question]
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
    // MARK: - Filtered Questions
    var filteredQuestions: [Question] {
        questions.filter { $0.category == category }
    }
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(filteredQuestions) { question in
                NavigationLink(destination: QuestionDetailView(question: question)) {
                    QuestionListItemView(question: question)
                }
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
                // NavigationLink
            }// ForEach
        }// List
        .navigationTitle(questions.first(where: { $0.category == category })?.categoryName ?? category)
        .navigationBarBackButtonHidden(true) // Скрытие стандартной кнопки назад
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .listStyle(.plain)
    }// Body
}// View

// MARK: - Preview
#Preview {
    CategoryQuestionsView(
        category: "swift-basics-icon",
        questions: Question.exampleQuestions
    )
    .environmentObject(FavoritesViewModel())
}
