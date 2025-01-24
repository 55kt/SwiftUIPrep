//
//  ProgressViewModel.swift
//  SwiftUIPrep
//
//  Created by Vlad on 16/1/25.
//

import SwiftUI

class ProgressViewModel: ObservableObject {
    @Published var progressItems: [ProgressItem] = []
    
    var sortedProgressItems: [ProgressItem] {
        progressItems.sorted { $0.date > $1.date }
    }
    
    init() {
        loadProgress()
    }
    
    func addProgress(item: ProgressItem) {
        progressItems.append(item)
        saveProgress()
    }
    
    func clearProgress() {
        progressItems.removeAll()
        saveProgress()
    }
    
    func medalColor(for score: Double) -> Color {
        // Debugging
        print("Score received in medalColor: \(score)")
        
        switch score {
        case 0.9...: // if score >= 0.9
            return .gold
        case 0.5..<0.9: // if 0.5 <= score < 0.9
            return .silver
        case 0.2..<0.5: // if 0.2 <= score < 0.5
            return .bronze
        default: // if score < 0.2
            return .white
        }
    }
    
    private func saveProgress() {
        do {
            let data = try JSONEncoder().encode(progressItems)
            UserDefaults.standard.set(data, forKey: "progressItems")
        } catch {
            print("Failed to save progress: \(error)")
        }
    }
    
    private func loadProgress() {
        if let data = UserDefaults.standard.data(forKey: "progressItems") {
            do {
                progressItems = try JSONDecoder().decode([ProgressItem].self, from: data)
            } catch {
                print("Failed to load progress: \(error)")
            }
        }
    }
}
