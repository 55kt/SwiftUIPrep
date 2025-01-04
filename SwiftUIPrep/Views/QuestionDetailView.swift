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
            VStack(alignment: .center, spacing: 20) {
                // Question Image
                Image(question.image)
                    .resizable()
                    .scaledToFit()
                
                // Question
                Text(question.question)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .background(
                        Color.accent
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // Answer
                Text(question.answer)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                // ScreenShots
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Code in pictures")
                    
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
