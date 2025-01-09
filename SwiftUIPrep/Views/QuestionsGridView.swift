//
//  QuestionsGridView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 9/1/25.
//

import SwiftUI

struct QuestionsGridView: View {
    // MARK: - Properties
    let filteredQuestions: [Question]
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)

    // Уникальные категории с сортировкой
    var uniqueCategories: [String] {
        let allCategories = filteredQuestions.map { $0.category }
        return Array(Set(allCategories)).sorted() // Сортировка по алфавиту
    }

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                ForEach(uniqueCategories, id: \.self) { category in
                    NavigationLink(destination: CategoryQuestionsView(category: category, questions: filteredQuestions.filter { $0.category == category })) {
                        let firstQuestionInCategory = filteredQuestions.first { $0.category == category }
                        if let question = firstQuestionInCategory {
                            CategoriesGridItemView(question: question)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    QuestionsGridView(filteredQuestions: QuestionViewModel().questions)
}
