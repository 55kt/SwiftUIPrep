//
//  QuestionGridItemView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 8/1/25.
//

import SwiftUI

struct CategoryGridItemView: View {
    // MARK: - Properties
    let question: Question
    
    // MARK: - Body
    var body: some View {
        Image(question.image)
            .resizable()
            .scaledToFit()
        
        Text(question.categoryName)
            .font(.title3)
            .fontWeight(.heavy)
    }
}

// MARK: - Preview
#Preview {
    CategoryGridItemView(question: Question.previewFromJSON(index: 5, language: "ru"))
}
