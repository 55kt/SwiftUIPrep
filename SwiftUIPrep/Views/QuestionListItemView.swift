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
                    .foregroundStyle(.accent)
                
                Text(question.answer)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }// VStack
        }// HStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    let sampleQuestion = Question(
        id: "1",
        category: "Swift",
        question: "What is a variable?",
        answer: "A variable is a placeholder for a value that can change during the execution of a program.",
        image: "question-icon",
        link: "https://www.google.com",
        gallery: ["screenshot-1", "screenshot-2"]
    )
    
    QuestionListItemView(question: sampleQuestion)
}
