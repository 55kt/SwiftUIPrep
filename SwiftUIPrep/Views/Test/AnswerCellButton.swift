//
//  AnswerCellButton.swift
//  SwiftUIPrep
//
//  Created by Vlad on 13/1/25.
//

import SwiftUI

struct AnswerCellButton: View {
    // MARK: - Properties
    var backgroundColor: Color = .blue
    let answerText: String
    var action: () -> ()
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Text(answerText)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
        }// Button
    }// Body
}// View

// MARK: - Preview
#Preview {
    AnswerCellButton(answerText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla commodo nec nisl non tempus. ?") {}
}
