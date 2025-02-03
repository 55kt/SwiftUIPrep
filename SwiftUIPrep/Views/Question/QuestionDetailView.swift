//
//  QuestionDetailView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 3/1/25.
//

import SwiftUI

struct QuestionDetailView: View {
    // MARK: - Properties
    let question: Question
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            // Header
            VStack(alignment: .center, spacing: 10) {
                HStack(alignment: .center, spacing: 16) {
                    Image(question.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(question.categoryName)
                            .font(.title2)
                            .fontWeight(.heavy)
                    }// VStack
                }// HStack
                
                // Question
                VStack(alignment: .center, spacing: 0) {
                    Text(question.question)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                    
                    Color(question.categoryColor)
                        .frame(height: 6)
                        .frame(width: 350)
                        .cornerRadius(3)
                    
                    // Answer
                    Text(question.answer)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        .padding(.horizontal)
                }// VStack - Question section
                
                VStack(alignment: .center, spacing: 2) {
                    HeadingView(headingImage: "info.circle", headingText: LocalizedStringKey("Description"), headingColor: Color(named: question.categoryColor))
                    
                    // Description
                    Text(question.description)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }// VStack - Description
            }// VStack
        }// ScrollView
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.accentColor)
                }
            }// ToolbarItem
        }// .toolbar
    }// Body
}// View

// MARK: - Preview
#Preview {
    NavigationStack {
        QuestionDetailView(question: Question.previewFromJSON(index: 2, language: "ru"))
    }
}
