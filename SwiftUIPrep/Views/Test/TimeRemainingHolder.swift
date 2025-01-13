//
//  TimeRemainingHolder.swift
//  SwiftUIPrep
//
//  Created by Vlad on 13/1/25.
//

import SwiftUI

struct TimeRemainingHolder: View {
    // MARK: - Properties
    var timeRemaining: Int
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle().fill(.ultraThinMaterial).frame(height: 80)
                .clipShape(Capsule())
            
            HStack(spacing: 10) {
                Text("Time Remaining:")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Image(systemName: "clock")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("\(timeString(from: timeRemaining))")
                    .font(.title2)
                    .fontWeight(.bold)
            }// HStack
            .padding()
        }// ZStack
    }// Body
    // MARK: - Helper Functions
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}// View

// MARK: - Preview
#Preview {
    TimeRemainingHolder(timeRemaining: 0)
}
