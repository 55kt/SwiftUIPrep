//
//  StartTestView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 12/1/25.
//

import SwiftUI

struct StartTestView: View {
    @State private var questionCount: Int = 10
    @State private var showTestView: Bool = false
    
    // Доступные варианты вопросов
    let questionOptions = Array(10...150).filter { $0 % 5 == 0 }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Заголовок
                Text("Setup Test")
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .bold()
                    .padding()
                
                // Выбор количества вопросов
                VStack(alignment: .center) {
                    Text("Number of Questions:")
                        .font(.system(size: 25, weight: .bold, design: .rounded))
                    
                    Picker("Number of Questions", selection: $questionCount) {
                        ForEach(questionOptions, id: \.self) { option in
                            Text("\(option)").tag(option)
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 150)
                }
                .padding(.horizontal)
                
                // Кнопка запуска теста
                Button(action: {
                    showTestView = true
                }) {
                    Text("Start Test")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(colors: [.accent.opacity(0.7), .gray.opacity(0.2)], startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.top)
                .navigationDestination(isPresented: $showTestView) {
                    QuestionTestView(questionCount: questionCount)
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
