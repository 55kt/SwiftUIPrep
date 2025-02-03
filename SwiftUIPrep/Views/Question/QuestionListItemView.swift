//
//  QuestionListItemView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct QuestionListItemView: View {
    // MARK: - Properties
    let question: Question
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(question.image)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(question.question)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .lineLimit(3)
                    .foregroundStyle(Color(question.categoryColor))
            }// VStack
        }// HStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    QuestionListItemView(question: Question.previewFromJSON(index: 5, language: "ru"))
}
