//
//  ProgressTabView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct ProgressTabView: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var currentLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @EnvironmentObject var progressViewModel: ProgressViewModel
    @State private var showAlert = false
    @State private var navigationTitle: String = ""
    
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
            .navigationTitle(navigationTitle)
            .onAppear{
                NavigationTitleHelper.updateTitle(
                    for: currentLanguage,
                    key: "progress",
                    binding: $navigationTitle
                )
            }
            .onChange(of: currentLanguage) { _ in
                NavigationTitleHelper.updateTitle(
                    for: currentLanguage,
                    key: "progress",
                    binding: $navigationTitle
                )
            }
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
