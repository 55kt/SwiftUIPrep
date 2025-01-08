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
    
    // MARK: - Filtered Questions
    var filteredQuestions: [Question] {
        if searchText.isEmpty {
            print("Filtered Questions: \(viewModel.questions)")
            return viewModel.questions
        } else {
            let filtered = viewModel.questions.filter { $0.question.localizedCaseInsensitiveContains(searchText) }
            print("Filtered Questions with search: \(filtered)")
            return filtered
        }// if - else
    }// var
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(filteredQuestions) { question in
                            NavigationLink(destination: QuestionDetailView(question: question)) {
                                QuestionListItemView(question: question)
                            }// NavigationLink
                        }// ForEach
                    }// List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(filteredQuestions) { question in
                                NavigationLink(destination: QuestionDetailView(question: question)) {
                                    CategoriesGridItemView(question: question)
                                }
                            }// ForEach
                        }// LazyVGrid
                    }// ScrollView
                }// if - else
            }// Group
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        // List
                        Button {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .white : .accent)
                        }
                        
                        // Categories
                        Button {
                            print("Categories view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.stack.fill")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .accent : .white)
                        }
                    }// HStack
                }// ToolbarItem
            }// toolbar
            .listStyle(PlainListStyle())
            .navigationTitle("SwiftUIPrep")
            .searchable(text: $searchText, prompt: LocalizedStringKey("Search for a question"))
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
