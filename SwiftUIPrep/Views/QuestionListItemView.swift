//
//  QuestionListItemView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct QuestionListItemView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image("question-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Question 1")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text("This is a test question. It is a very long question that will wrap to multiple lines. This is a test question. It is a very long question that will wrap to multiple lines.")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }// VStack
        }// HStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    QuestionListItemView()
}
