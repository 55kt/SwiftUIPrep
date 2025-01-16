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
    let timeElapsed: Int

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var progressViewModel: ProgressViewModel

    var body: some View {
        ZStack {
            // Background
            VStack(spacing: 30) {
                Text("Test Completed !")
                    .font(.title)
                    .bold()

                VStack(spacing: 10) {
                    Text("You answered \(correctAnswers) out of \(totalQuestions) correctly")
                        .font(.headline)

                    Text("Time Elapsed: \(timeString(from: timeElapsed))")
                        .font(.subheadline)

                    Text(resultMessage)
                        .font(.body)
                        .foregroundColor(.secondary)
                }// VStack

                TestViewsButton(buttonName: "Save and Return") {
                    addProgressAutomatically()
                    presentationMode.wrappedValue.dismiss()
                }// TestViewsButton
            }// VStack
            .padding()
        }// ZStack
    }// Body

    private var resultMessage: String {
        let score = Double(correctAnswers) / Double(totalQuestions)
        if score == 1.0 {
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

    private func addProgressAutomatically() {
        let newProgressItem = ProgressItem(
            correctAnswers: correctAnswers,
            totalQuestions: totalQuestions,
            timeElapsed: timeElapsed,
            date: Date()
        )
        progressViewModel.addProgress(item: newProgressItem)
    }
}

#Preview {
    ResultTestView(correctAnswers: 3, totalQuestions: 5, timeElapsed: 120)
}
