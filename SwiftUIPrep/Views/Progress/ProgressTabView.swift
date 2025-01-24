//
//  ProgressTabView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct ProgressTabView: View {
    // MARK: - Properties
    @EnvironmentObject var progressViewModel: ProgressViewModel
    @State private var showAlert = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                ForEach(progressViewModel.sortedProgressItems, id: \.date) { item in
                    let score = item.totalQuestions > 0
                    ? Double(item.correctAnswers) / Double(item.totalQuestions)
                    : 0.0
                    
                    ProgressItemView(
                        answeredQText:  "You answered \(item.correctAnswers) out of \(item.totalQuestions) questions",
                        time: "Time: \(timeString(from: item.timeElapsed))",
                        date: item.date,
                        medalColor: progressViewModel.medalColor(for: score)
                    )// ProgressItemView
                    .listRowBackground(Color.clear)
                }// ForEach
            }// List
            .listStyle(.plain)
            .navigationTitle("Progress")
            .background(
                MotionAnimationView()
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarButtons.clearProgressButton(showAlert: $showAlert, progressViewModel: progressViewModel)
                }// ToolbarItem
            }// .toolbar
        }// NavigationStack
    }// Body
    
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }// func
}// View

// MARK: - Preview
#Preview {
    ProgressTabView()
        .environmentObject(ProgressViewModel())
}
