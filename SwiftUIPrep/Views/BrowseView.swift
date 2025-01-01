//
//  BrowseView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct BrowseView: View {
    // MARK: - Properties
    let questions: [Question] = Bundle.main.decode("questions.json")
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(questions) { question in
                    QuestionListItemView(question: question)
                }
            }// List
            .navigationTitle("SwiftUIPrep")
        }// NavigationStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    BrowseView()
}
