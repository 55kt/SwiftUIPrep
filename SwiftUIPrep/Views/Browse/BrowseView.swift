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
    @State private var hasLoadedQuestions: Bool = false
    
    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    // MARK: - Filtered Questions
    var filteredQuestions: [Question] {
        if searchText.isEmpty {
            return currentQuestions
        } else {
            return currentQuestions.filter { $0.question.localizedCaseInsensitiveContains(searchText) }
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
                    if !isGridViewActive {
                        ToolbarButtons.shuffleButton(onShuffle: shuffleQuestions)
                    }
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
                
                if !hasLoadedQuestions {
                    loadInitialQuestions()
                    hasLoadedQuestions = true                }
            }
            .onChange(of: appLanguage) { newLanguage in
                print("🌐 Language changed to: \(newLanguage)")
                
                UserDefaults.standard.removeObject(forKey: "ShuffledQuestions")
                UserDefaults.standard.removeObject(forKey: "DidShuffleQuestions")
                
                viewModel.loadQuestions()
                
                loadInitialQuestions()
                print("✅ Questions reloaded for \(newLanguage)")
            }
            .environment(\.locale, Locale(identifier: appLanguage))
        }// NavigationStack
    }// Body
    
    // MARK: - Methods
    private func loadInitialQuestions() {
        if let savedQuestions = UserDefaults.standard.data(forKey: "ShuffledQuestions") {
            if let decodedQuestions = try? JSONDecoder().decode([Question].self, from: savedQuestions), !decodedQuestions.isEmpty {
                currentQuestions = decodedQuestions
                print("Loaded questions from UserDefaults.")
                return
            }
        }
        
        let shuffledQuestions = viewModel.questions.shuffled()
        currentQuestions = shuffledQuestions
        
        if let encodedQuestions = try? JSONEncoder().encode(shuffledQuestions) {
            UserDefaults.standard.set(encodedQuestions, forKey: "ShuffledQuestions")
        }
        UserDefaults.standard.set(true, forKey: "DidShuffleQuestions")
        print("Shuffled and saved questions.")
    }
    
    private func shuffleQuestions() {
        haptics.impactOccurred()
        withAnimation {
            currentQuestions.shuffle()
            shuffleTrigger.toggle()
            
            if let encodedQuestions = try? JSONEncoder().encode(currentQuestions) {
                UserDefaults.standard.set(encodedQuestions, forKey: "ShuffledQuestions")
            }
        }
    }
}// View

// MARK: - Preview
#Preview {
    BrowseView()
        .environmentObject(QuestionViewModel())
}
