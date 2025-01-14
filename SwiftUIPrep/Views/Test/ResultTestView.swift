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
    let timeRanOut: Bool
    let timeElapsed: Int
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            MotionAnimationView()
                .ignoresSafeArea(.all)
            
            VStack(spacing: 30) {
                // Заголовок
                Text("Test Completed !")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                
                if timeRanOut {
                    // Message if time ran out
                    Text("Time is Over !")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.red)
                        .padding(.vertical, 10)
                }
                
                // Test Results
                VStack(spacing: 12) {
                    Text("You answered")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    
                    Text("\(correctAnswers) out of \(totalQuestions) correctly")
                        .font(.title)
                        .foregroundColor(correctAnswers > totalQuestions / 2 ? .primary : .orange)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(UIColor.secondarySystemBackground))
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                )
                .padding(.horizontal)
                
                // Время прохождения теста
                            VStack(spacing: 12) {
                                Text("Time Elapsed")
                                    .font(.headline)
                                    .foregroundStyle(.secondary)
                                
                                Text("\(timeString(from: timeElapsed))")
                                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(UIColor.secondarySystemBackground))
                                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                            )
                            .padding(.horizontal)
                
                // Message based on result
                Text(resultMessage)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(UIColor.secondarySystemBackground))
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                    )
                    .padding(.horizontal)
                
                Spacer()
                
                // Restart button (back to StartTestView)
                TestViewsButton(buttonName: "Restart Test", action: {
                    presentationMode.wrappedValue.dismiss()
                })
                .padding()
                .padding(.bottom, 100)
            }
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
    
    private func timeString(from seconds: Int) -> String {
            let minutes = seconds / 60
            let seconds = seconds % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
}

#Preview {
    ResultTestView(correctAnswers: 3, totalQuestions: 5, timeRanOut: false, timeElapsed: 120)
}
