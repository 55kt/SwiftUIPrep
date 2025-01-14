//
//  ProgressBarLine.swift
//  SwiftUIPrep
//
//  Created by Vlad on 13/1/25.
//

import SwiftUI

struct ProgressBarLine: View {
    // MARK: - Properties
    let currentQuestion: Int
    let totalQuestions: Int
    
    var progress: Double {
        guard totalQuestions > 0 else { return 0.0 }
        return Double(currentQuestion) / Double(totalQuestions)
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Text("Question \(currentQuestion) of \(totalQuestions)")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }// HStack
            ProgressView(value: progress)
                .tint(.accent) // Задаём цвет прогресса
                .frame(height: 12)
                .clipShape(Capsule())
        }// VStack
        .padding(.horizontal)
    }// Body
}// View

// MARK: - Preview
#Preview {
    ProgressBarLine(currentQuestion: 1, totalQuestions: 2)
}
