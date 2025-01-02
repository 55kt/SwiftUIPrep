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
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(filteredQuestions) { question in
                    QuestionListItemView(question: question)
                }// ForEach
            }// List
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
