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
                // NavigationLink
            }// ForEach
        }// List
        .navigationTitle(questions.first(where: { $0.category == category })?.categoryName ?? category)
        .listStyle(.plain)
    }// Body
}// View

// MARK: - Preview
#Preview {
    CategoryQuestionsView(
            category: "swift-basics-icon",
            questions: Question.exampleQuestions
        )
}
