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
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            // Header
            VStack(alignment: .center, spacing: 10) {
                HStack {
                    // Question Image
                    Image(question.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150, alignment: .leading)
                        .padding(.leading)
                    
                    // Category
                    Text(question.categoryName)
                        .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                    
                }// HStack - Header
                .frame(maxWidth: .infinity, alignment: .leading) // Установите фиксированное выравнивание
                
                // Question
                VStack(spacing: 0) {
                    Text(question.question)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .foregroundStyle(.primary)
                    
                    Color(question.categoryColor)
                        .frame(height: 6)
                        .frame(width: 350)
                        .cornerRadius(3)
                    
                    // Answer
                    Text(question.answer)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding(.top)
                        .padding(.horizontal)
                }// VStack - Question section
                
                VStack(alignment: .center, spacing: 2) {
                    HeadingView(headingImage: "info.circle", headingText: LocalizedStringKey("Description"), headingColor: Color(named: question.categoryColor))
                    
                    // Description
                    Text(question.description)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                }// VStack - Description
                
            }// VStack
        }// ScrollView
    }// Body
}// View

// MARK: - Preview
#Preview {
    NavigationStack {
            QuestionDetailView(question: Question.previewFromJSON(index: 12, language: "ru"))
        }
}
