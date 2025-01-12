//
//  StartTestView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 12/1/25.
//

import SwiftUI

struct StartTestView: View {
    @State private var questionCount: Double = 10
    @State private var testDuration: Double = 5
    @State private var showTestView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Setup Test")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("Number of Questions: \(Int(questionCount))")
                        .font(.headline)
                    Slider(value: $questionCount, in: 5...150, step: 5)
                        .padding(.horizontal)
                }
                
                VStack(alignment: .leading) {
                    Text("Test Duration: \(Int(testDuration)) minutes")
                        .font(.headline)
                    Slider(value: $testDuration, in: 1...60, step: 1)
                        .padding(.horizontal)
                }
                
                Button(action: {
                    showTestView = true
                }) {
                    Text("Start Test")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding(.top)
                .navigationDestination(isPresented: $showTestView) {
                    QuestionTestView(questionCount: Int(questionCount), testDuration: Int(testDuration))
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    StartTestView()
}
