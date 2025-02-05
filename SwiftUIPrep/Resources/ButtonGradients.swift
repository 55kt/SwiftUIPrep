//
//  ButtonGradients.swift
//  SwiftUIPrep
//
//  Created by Vlad on 14/1/25.
//

import SwiftUI

struct ButtonGradients {
    static let correctAnswer = LinearGradient(
        gradient: Gradient(colors: [Color.green.opacity(0.8), Color.teal.opacity(0.8)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let incorrectAnswer = LinearGradient(
        gradient: Gradient(colors: [Color.red.opacity(0.9), Color.orange.opacity(0.9)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    static let defaultButton = LinearGradient(
        gradient: Gradient(colors: [Color.gray.opacity(0.5), Color.black.opacity(0.7)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    static let birdGradient = LinearGradient(
        gradient: Gradient(colors: [Color(red: 1.0, green: 0.27, blue: 0.0), Color(red: 1.0, green: 0.39, blue: 0.28)]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
