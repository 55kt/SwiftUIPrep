//
//  AnswerCellButton.swift
//  SwiftUIPrep
//
//  Created by Vlad on 13/1/25.
//

import SwiftUI

struct AnswerCellButton: View {
    // MARK: - Properties
    var isCorrect: Bool? = nil
    let answerText: String
    var action: () -> Void
    
    private var background: LinearGradient {
        if let isCorrect = isCorrect {
            return isCorrect ? ButtonGradients.correctAnswer : ButtonGradients.incorrectAnswer
        }
        return ButtonGradients.defaultButton
    }
    
    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Text(answerText)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(background)
                        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
                )
                .foregroundColor(.white)
        }// Button
    }// Body
}// View

// MARK: - Preview
#Preview {
    VStack(spacing: 10) {
        AnswerCellButton(isCorrect: true, answerText: "Correct Answer") {}
        AnswerCellButton(isCorrect: false, answerText: "Incorrect Answer") {}
        AnswerCellButton(answerText: "Default Button") {}
    }
    .padding()
}
