//
//  SelectRowView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/1/25.
//

import SwiftUI

struct SelectRowView: View {
    // MARK: - Properties
    var icon: String
    var color: Color
    var text: String
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundStyle(.white)
            }// ZStack
            .frame(width: 36, height: 36, alignment: .center)
            
            Text(text).foregroundStyle(.gray)
            
            Spacer()
            
            Button {
                action()
            } label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            }
            .foregroundStyle(.gray)
        }// HStack
    }// Body
}

// MARK: - Properties
#Preview {
    SelectRowView(icon: "globe", color: .accent, text: "Button Text Name") {}
}
