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
        ZStack {
            Image(question.image)
                .resizable()
                .scaledToFit()
            
            Text(question.categoryName)
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
        }
    }
}

// MARK: - Preview
#Preview {
    CategoriesGridItemView(question: Question.previewFromJSON(index: 3, language: "en"))
}
