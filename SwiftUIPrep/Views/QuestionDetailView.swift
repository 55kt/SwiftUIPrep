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
            VStack(alignment: .center, spacing: 20) {
                HStack(alignment: .center, spacing: 20) {
                    // Question Image
                    Image(question.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150, alignment: .leading)
                    
                    // Category
                    Text(question.categoryName)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                
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
                }
                
                // Answer
                Text(question.answer)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                // ScreenShots
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Screenshots", headingColor: Color(named: question.categoryColor))
                    
                    InsetScreenshotView(question: question)
                }.padding(.horizontal)
                
                // Gallery
                
                // Answer
                
                // Tags
                
            }// VStack
        }// ScrollView
    }// Body
}// View

// MARK: - Preview
#Preview {
    let sampleQuestion = Question(
        id: "1",
        category: "Swift",
        categoryName: "Swift Basics",
        categoryColor: "swift-basics-color",
        question: "What is a variable?",
        answer: "A variable is a placeholder for a value that can change during the execution of a program.",
        image: "question-icon",
        link: "https://www.google.com",
        gallery: ["screenshot-1", "screenshot-2"]
    )
    
    NavigationStack {
        QuestionDetailView(question: sampleQuestion)
    }
}
