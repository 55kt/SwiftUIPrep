//
//  PreviewPlaceholder.swift
//  SwiftUIPrep
//
//  Created by Vlad on 7/1/25.
//

import Foundation

extension Question {
    static var previewPlaceholder: Question {
        Question(
            id: "question1",
            category: "swift-basics-icon",
            categoryName: "Swift Basics",
            categoryColor: "swift-basics-color",
            question: "What is a variable?",
            answer: "A variable is a placeholder for a value.",
            description: "A variable is a placeholder for a value. It is a container that can hold a value. The value can change during the execution of a program.",
            image: "swift-basics-icon",
            link: "https://developer.apple.com/documentation/swift"
        )
    }
    
    static func previewFromJSON(index: Int = 0, language: String = "en") -> Question {
        let sampleQuestions = JSONLoader.loadQuestions(for: language)
        guard sampleQuestions.indices.contains(index) else {
            fatalError("Invalid index or insufficient questions in JSON.")
        }
        return sampleQuestions[index]
    }
}

extension Question {
    static let exampleQuestions: [Question] = [
        Question(
            id: "question1",
            category: "swift-basics-icon",
            categoryName: "Swift Basics",
            categoryColor: "swift-basics-color",
            question: "What is a variable?",
            answer: "A variable is a placeholder for a value.",
            description: "A variable is a container that holds data and can change during the program's execution.",
            image: "swift-basics-icon",
            link: "https://developer.apple.com/documentation/swift"
        ),
        Question(
            id: "question2",
            category: "swift-basics-icon",
            categoryName: "Swift Basics",
            categoryColor: "swift-basics-color",
            question: "What is a constant?",
            answer: "A constant holds a value that cannot change.",
            description: "A constant is a container that holds a value which cannot be changed once it's assigned.",
            image: "swift-basics-icon",
            link: "https://developer.apple.com/documentation/swift"
        )
    ]
}
