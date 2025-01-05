//
//  QuestionModel.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct Question: Codable, Identifiable {
    let id: String
    let category: String
    let categoryName: String
    let categoryColor: String
    let question: String
    let answer: String
    let image: String
    let link: String
}
