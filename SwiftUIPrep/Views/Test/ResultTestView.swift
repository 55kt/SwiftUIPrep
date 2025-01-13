//
//  ResultTestView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 12/1/25.
//

import SwiftUI

struct ResultTestView: View {
    let correctAnswers: Int
    let totalQuestions: Int
    let timeRanOut: Bool // Новый параметр
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Test Completed!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            if timeRanOut {
                Text("Time is Over!")
                    .font(.title)
                    .foregroundColor(.red)
            }
            
            Text("You answered \(correctAnswers) out of \(totalQuestions) correctly.")
                .font(.headline)
                .padding()
            
            Text(resultMessage)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss() // Закрывает текущий экран и возвращает назад
            }) {
                Text("Restart Test")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
    
    private var resultMessage: String {
        let score = Double(correctAnswers) / Double(totalQuestions)
        if timeRanOut {
            return "Time ran out! Try again to improve your speed."
        } else if score == 1.0 {
            return "Perfect Score! Well done!"
        } else if score >= 0.8 {
            return "Great Job! You can do even better."
        } else {
            return "Keep practicing to improve."
        }
    }
}

#Preview {
    ResultTestView(correctAnswers: 3, totalQuestions: 2, timeRanOut: false)
}
