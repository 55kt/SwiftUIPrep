//
//  ProgressItem.swift
//  SwiftUIPrep
//
//  Created by Vlad on 16/1/25.
//

import Foundation

struct ProgressItem: Codable {
    let correctAnswers: Int
    let totalQuestions: Int
    let timeElapsed: Int
    let date: Date
}
