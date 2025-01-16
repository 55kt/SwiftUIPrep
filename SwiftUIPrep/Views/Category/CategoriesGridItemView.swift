//
//  CategoriesGridItemView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 8/1/25.
//

import SwiftUI

struct CategoriesGridItemView: View {
    // MARK: - Properties
    let question: Question
    
    // MARK: - Body
    var body: some View {
        VStack {
            ZStack {
                // Category Icon
                Image(question.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }// ZStack
            
            // Category Name
            Text(question.categoryName)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
        }// VStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    CategoriesGridItemView(question: Question.previewFromJSON(index: 5, language: "en"))
}
