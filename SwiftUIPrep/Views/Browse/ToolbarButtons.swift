//
//  ToolbarButtons.swift
//  SwiftUIPrep
//
//  Created by Vlad on 9/1/25.
//

import SwiftUI


struct ToolbarButtons {
    // MARK: - Static Button Functions

    // Button for shuffling questions list
    static func shuffleButton(onShuffle: @escaping () -> Void) -> some View {
        Button(action: {
            onShuffle()
        }) {
            Image(systemName: "shuffle")
                .font(.title2)
                .foregroundStyle(.accent)
        }
    }

    // Button for activating list view
    static func listViewButton(isGridViewActive: Binding<Bool>) -> some View {
        Button(action: {
            isGridViewActive.wrappedValue = false
            let haptics = UIImpactFeedbackGenerator(style: .medium)
            haptics.impactOccurred()
            print("List view is activated")
        }) {
            Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundStyle(isGridViewActive.wrappedValue ? .white : .accent)
        }
    }

    // Button for activating grid categories view
    static func gridViewButton(isGridViewActive: Binding<Bool>) -> some View {
        Button(action: {
            isGridViewActive.wrappedValue = true
            let haptics = UIImpactFeedbackGenerator(style: .medium)
            haptics.impactOccurred()
            print("Grid view is activated")
        }) {
            Image(systemName: "square.stack.fill")
                .font(.title2)
                .foregroundStyle(isGridViewActive.wrappedValue ? .accent : .white)
        }
    }
}
