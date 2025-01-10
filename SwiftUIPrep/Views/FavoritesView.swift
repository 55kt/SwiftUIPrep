//
//  FavoritesView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct FavoritesView: View {
    // MARK: - Properties
    @EnvironmentObject var favoritesViewModel: FavoritesViewModel
    
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
                            .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)
                    }
                } else {
                    List {
                        ForEach(favoritesViewModel.favoriteQuestions) { question in
                            NavigationLink(destination: QuestionDetailView(question: question)) {
                                QuestionListItemView(question: question)
                            }
                        }
                        .onDelete(perform: deleteQuestion)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Favorites")
            .toolbar {
                EditButton()
            }
        }
    }
    
    // MARK: - Methods
    private func deleteQuestion(at offsets: IndexSet) {
        for index in offsets {
            let question = favoritesViewModel.favoriteQuestions[index]
            favoritesViewModel.removeFromFavorites(question)
        }
    }
}

// MARK: - Preview
#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}
