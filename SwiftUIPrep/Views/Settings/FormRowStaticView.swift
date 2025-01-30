//
//  FormRowStaticView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/1/25.
//

import SwiftUI

struct FormRowStaticView: View {
    // MARK: - Properties
    var icon: String
    var firstText: String
    var secondText: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundStyle(.white)
            }// ZStack
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(firstText).foregroundStyle(.gray)
            Spacer()
            Text(secondText)
        }// HStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    FormRowStaticView(icon: "gear", firstText: "Application", secondText: "SecondText")
}
