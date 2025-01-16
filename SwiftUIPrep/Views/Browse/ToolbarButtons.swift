//
//  ToolbarButtons.swift
//  SwiftUIPrep
//
//  Created by Vlad on 9/1/25.
//

import SwiftUI

struct ToolbarButtons: View {
    // MARK: - Properties
    @Binding var isGridViewActive: Bool
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 16) {
            
            // List View Button
            Button(action: {
                isGridViewActive = false
                haptics.impactOccurred()
                print("List view is activated")
            }) {
                Image(systemName: "square.fill.text.grid.1x2")
                    .font(.title2)
                    .foregroundStyle(isGridViewActive ? .white : .accent)
            }
            
            // Grid View Button
            Button(action: {
                isGridViewActive = true
                haptics.impactOccurred()
                print("Grid view is activated")
            }) {
                Image(systemName: "square.stack.fill")
                    .font(.title2)
                    .foregroundStyle(isGridViewActive ? .accent : .white)
            }
        }// HStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    ToolbarButtons(isGridViewActive: .constant(true))
}
