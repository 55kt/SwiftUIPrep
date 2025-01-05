//
//  InsetScreenshotView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 3/1/25.
//

import SwiftUI

struct InsetScreenshotView: View {
    // MARK: - Properties
    let question: Question
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 50) {
                ForEach(question.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }// ForEach
            }// HStack
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
    
    InsetScreenshotView(question: sampleQuestion)
}
