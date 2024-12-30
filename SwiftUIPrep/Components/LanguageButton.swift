//
//  LanguageButton.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct LanguageButton: View {
    // MARK: - Properties
    var languageTitle: LocalizedStringKey
    var backgroundColor: Color
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(languageTitle)
                .padding()
                .frame(maxWidth: .infinity)
                .background(backgroundColor)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.horizontal)
        }
    }// Body
}// View

// MARK: - Preview
#Preview {
    LanguageButton(languageTitle: "English", backgroundColor: .blue) {
            print("Language Selected: English")
        }
}
