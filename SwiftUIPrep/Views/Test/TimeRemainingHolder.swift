//
//  TimeRemainingHolder.swift
//  SwiftUIPrep
//
//  Created by Vlad on 13/1/25.
//

import SwiftUI

class TimerManager: ObservableObject {
    @Published var timeRemaining: Int
    @Published var testCompleted: Bool = false
    @Published var timeElapsed: Int = 0

    private var timer: Timer?

    init(initialTime: Int) {
        self.timeRemaining = initialTime
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
                self.timeElapsed += 1
            } else {
                self.stopTimer()
                self.testCompleted = true
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

struct TimeRemainingHolder: View {
    // MARK: - Properties
    @ObservedObject var timerManager: TimerManager

    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.ultraThinMaterial)
                .frame(height: 80)
                .clipShape(Capsule())
                .shadow(radius: 4)

            HStack(spacing: 10) {
                Text("Time Remaining:")
                    .font(.title2)
                    .fontWeight(.bold)

                Image(systemName: "clock")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("\(timeString(from: timerManager.timeRemaining))")
                    .font(.title2)
                    .fontWeight(.bold)
            } // HStack
            .padding()
        } // ZStack
        .onAppear {
            timerManager.startTimer()
        }// OnAppear
        .onDisappear {
            timerManager.stopTimer()
        }// OnDisappear
    }// Body

    // MARK: - Methods
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }// func
}// View

// MARK: - Preview
#Preview {
    TimeRemainingHolder(timerManager: TimerManager(initialTime: 300))
}
