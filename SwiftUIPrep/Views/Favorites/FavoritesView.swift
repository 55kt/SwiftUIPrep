//
//  FavoritesView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct FavoritesView: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var currentLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    @State private var navigationTitle: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            Group {
                if favoritesViewModel.favoriteQuestions.isEmpty {
                    VStack {
                        Text("No Favorites Yet")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Image(systemName: "star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)
                            .foregroundColor(.accent)
                    }// VStack
                } else {
                    List {
                        ForEach(favoritesViewModel.favoriteQuestions) { question in
                            NavigationLink(destination: QuestionDetailView(question: question)) {
                                QuestionListItemView(question: question)
                            }// NavigationLink
                        }// ForEach
                        .onDelete(perform: deleteQuestion)
                    }// List
                    .listStyle(PlainListStyle())
                }// if - else
            }// Group
            .navigationTitle(navigationTitle)
            .onAppear {
                NavigationTitleHelper.updateTitle(
                    for: currentLanguage,
                    key: "favorites",
                    binding: $navigationTitle
                )
            }
            .onChange(of: currentLanguage) { _ in
                NavigationTitleHelper.updateTitle(
                    for: currentLanguage,
                    key: "favorites",
                    binding: $navigationTitle
                )
            }
        }// NavigationStack
    }// Body
    
    // MARK: - Methods
    private func deleteQuestion(at offsets: IndexSet) {
        for index in offsets {
            let question = favoritesViewModel.favoriteQuestions[index]
            favoritesViewModel.removeFromFavorites(question)
        }
    }// func
}// View

// MARK: - Preview
#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
