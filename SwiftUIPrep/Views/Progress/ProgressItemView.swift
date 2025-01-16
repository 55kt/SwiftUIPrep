//
//  ProgressItemView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 16/1/25.
//

import SwiftUI

struct ProgressItemView: View {
    // MARK: - Properties
    var answeredQText: LocalizedStringKey
    var time: LocalizedStringKey
    var date: Date
    var medalColor: Color
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: "medal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .foregroundStyle(medalColor)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(answeredQText)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(time)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Text(date.formatted(date: .numeric, time: .shortened))
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }// VStack
            .frame(maxWidth: .infinity, alignment: .leading)
        }// HStack
        .frame(maxWidth: .infinity, alignment: .center)
    }// Body
}// View

// MARK: - Preview
#Preview {
    ProgressItemView(answeredQText: "You answered 10 out of 10 questions",
                     time: "Your time is 12:32",
                     date: Date(),
                     medalColor: .yellow
    )
}
