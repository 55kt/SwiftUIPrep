//
//  StartTestView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 12/1/25.
//

import SwiftUI

struct StartTestView: View {
    // MARK: - Properties
    @State private var questionCount: Int = 10
    @State private var showTestView: Bool = false
    
    let questionOptions = Array(10...150).filter { $0 % 5 == 0 }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                
                VStack(spacing: 20) {
                    
                    // Header
                    Text("Setup Test")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    // Select number of questions
                    VStack(alignment: .center) {
                        Text("Number of Questions:")
                            .font(.title2)
                        
                        Picker("Number of Questions", selection: $questionCount) {
                            ForEach(questionOptions, id: \.self) { option in
                                Text("\(option)").tag(option)
                                    .font(.title)
                            }// ForEach
                        }// Picker
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 150)
                    }// VStack
                    .padding(.horizontal)
                    
                    // Start test button
                    TestViewsButton(buttonName: "Start Test", action: {
                        showTestView = true
                    })
                    .navigationDestination(isPresented: $showTestView) {
                        QuestionTestView(questionCount: questionCount)
                            .navigationBarBackButtonHidden(true)
                    }// .navigationDestination
                    Spacer()
                }// VStack
                .padding()
            }// ZStack
        }// NavigationStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    StartTestView()
}
