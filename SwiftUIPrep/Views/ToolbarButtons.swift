//
//  ToolbarButtons.swift
//  SwiftUIPrep
//
//  Created by Vlad on 9/1/25.
//

import SwiftUI


struct ToolbarButtons {
    // MARK: - Static Button Functions
    
    // Button for going back
    static func backButton(action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundStyle(.accent)
        }
    }
    
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
    
    // Button for clearing progress
    static func clearProgressButton(showAlert: Binding<Bool>, progressViewModel: ProgressViewModel) -> some View {
        Button(action: {
            if progressViewModel.progressItems.isEmpty {
                let haptics = UINotificationFeedbackGenerator()
                haptics.notificationOccurred(.error)
                print("No progress to clear")
            } else {
                showAlert.wrappedValue = true
            }
        }) {
            Image(systemName: "trash")
                .font(.title2)
                .foregroundStyle(.red)
        }
        .alert(isPresented: showAlert) {
            Alert(
                title: Text("Delete all progress ?"),
                message: Text("Are you sure you want to delete all progress ? Current data cannot be restored !"),
                primaryButton: .destructive(Text("Delete")) {
                    progressViewModel.clearProgress()
                    let haptics = UINotificationFeedbackGenerator()
                    haptics.notificationOccurred(.warning)
                    print("Progress cleared")
                },
                secondaryButton: .cancel(Text("Cancel"))
            )
        }
    }
}
