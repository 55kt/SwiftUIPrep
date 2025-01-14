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
        VStack(spacing: 24) {
            // Заголовок
            Text("Test Completed!")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.blue, .purple], startPoint: .top, endPoint: .bottom))
                .padding(.top, 40)
            
            if timeRanOut {
                // Уведомление о завершении времени
                Text("Time is Over!")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.red)
                    .padding(.vertical, 10)
            }
            
            // Результаты теста
            VStack(spacing: 12) {
                Text("You answered")
                    .font(.headline)
                    .foregroundStyle(.secondary)
                
                Text("\(correctAnswers) out of \(totalQuestions) correctly")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                    .foregroundColor(correctAnswers > totalQuestions / 2 ? .green : .orange)
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
                                .foregroundColor(.blue)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(UIColor.secondarySystemBackground))
                                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                        )
                        .padding(.horizontal)
            
            // Сообщение о результате
            Text(resultMessage)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(colors: [Color.blue.opacity(0.1), Color.white], startPoint: .top, endPoint: .bottom))
                        .shadow(color: .gray.opacity(0.2), radius: 5)
                )
            
            Spacer()
            
            // Кнопка перезапуска
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Restart Test")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(colors: [.purple, .blue], startPoint: .leading, endPoint: .trailing)
                    )
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
        .padding()
        .background(
            LinearGradient(colors: [Color(UIColor.systemGroupedBackground), Color.white], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
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
