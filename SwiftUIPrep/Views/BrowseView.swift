//
//  BrowseView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct BrowseView: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @State private var searchText: String = ""
    @EnvironmentObject var viewModel: QuestionViewModel
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var randomQuestions: [Question] {
        return viewModel.questions.shuffled()
    }

    var orderedQuestions: [Question] {
        return viewModel.questions
    }
    
    // MARK: - Filtered Questions
    var filteredQuestions: [Question] {
        let source = isGridViewActive ? orderedQuestions : randomQuestions
        if searchText.isEmpty {
            return source
        } else {
            return source.filter { $0.question.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Group {
                if !isGridViewActive {
                    QuestionsListView(filteredQuestions: filteredQuestions)
                } else {
                    QuestionsGridView(filteredQuestions: filteredQuestions)
                }// if - else
            }// Group
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ToolbarContentView(isGridViewActive: $isGridViewActive)
                }// ToolbarItem
            }// toolbar
            .listStyle(PlainListStyle())
            .navigationTitle("SwiftUIPrep")
            .searchable(text: $searchText, prompt: LocalizedStringKey("Search for a question"))
            .animation(.default, value: searchText)
            .onAppear {
                viewModel.loadQuestions()
            }// onAppear
        }// NavigationStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    BrowseView()
        .environmentObject(QuestionViewModel())
}
