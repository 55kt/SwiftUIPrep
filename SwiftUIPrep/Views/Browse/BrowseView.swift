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
    @State private var currentQuestions: [Question] = []
    @State private var shuffleTrigger: Bool = false
    
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
                        .animation(.default, value: shuffleTrigger)
                } else {
                    CategoryGridView(filteredQuestions: filteredQuestions)
                }// if - else
            }// Group
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ToolbarButtons.shuffleButton(onShuffle: shuffleQuestions)
                }// ToolbarItem leading
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        ToolbarButtons.listViewButton(isGridViewActive: $isGridViewActive)
                        ToolbarButtons.gridViewButton(isGridViewActive: $isGridViewActive)
                    }// HStack
                }// ToolbarItem trailing
            }// .toolbar
            .listStyle(.plain)
            .navigationTitle(!isGridViewActive ? "SwiftUIPrep" : LocalizedStringKey("Categories"))
            .if(!isGridViewActive) { view in
                view.searchable(text: $searchText, prompt: LocalizedStringKey("Search for a question"))
            }// .if
            .animation(.default, value: searchText)
            .onAppear {
                viewModel.loadQuestions()
            }// .onAppear
            .environment(\.locale, Locale(identifier: appLanguage))
        }// NavigationStack
    }// Body
    
    // MARK: - Methods
    private func loadInitialQuestions() {
        currentQuestions = viewModel.questions
    }
    
    private func shuffleQuestions() {
        haptics.impactOccurred()
        withAnimation {
            currentQuestions.shuffle()
            shuffleTrigger.toggle()
        }
    }
}// View

// MARK: - Preview
#Preview {
    BrowseView()
        .environmentObject(QuestionViewModel())
}
