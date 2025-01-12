//
//  QuestionTestView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct QuestionTestView: View {
    // MARK: - Properties
    @EnvironmentObject var questionViewModel: QuestionViewModel
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String? = nil
    @State private var testQuestions: [Question] = []
    @State private var currentShuffledAnswers: [String] = []
    
    var body: some View {
        if currentQuestionIndex < testQuestions.count {
            VStack(spacing: 20) {
                // Отображение текста вопроса
                Text(testQuestions[currentQuestionIndex].question)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Варианты ответа
                ForEach(currentShuffledAnswers, id: \.self) { answer in
                    Button(action: {
                        handleAnswerSelection(answer)
                    }) {
                        Text(answer)
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(buttonBackgroundColor(for: answer))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(selectedAnswer != nil) // Блокируем кнопки после выбора
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                loadQuestionsIfNeeded()
            }
            .onChange(of: currentQuestionIndex) { _ in
                resetState()
                currentShuffledAnswers = generateShuffledAnswers(for: testQuestions[currentQuestionIndex])
            }
        } else {
            // Показываем результаты
            VStack {
                Text("Test Completed!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("You completed the test.")
                    .font(.headline)
                    .padding()
                
                Button("Restart Test") {
                    restartTest()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .padding()
        }
    }
    
    // MARK: - Helper Functions
    
    private func loadQuestionsIfNeeded() {
        if testQuestions.isEmpty {
            testQuestions = questionViewModel.questions.shuffled() // Загружаем вопросы из ViewModel
        }
        if !testQuestions.isEmpty {
            currentShuffledAnswers = generateShuffledAnswers(for: testQuestions[currentQuestionIndex])
        }
    }
    
    private func generateShuffledAnswers(for question: Question) -> [String] {
        var answers = question.incorrectAnswers.shuffled()
        answers = Array(answers.prefix(2)) // Берем только два случайных неправильных ответа
        answers.append(question.answer) // Добавляем правильный ответ
        return answers.shuffled() // Перемешиваем все три ответа
    }
    
    private func shuffledAnswers() -> [String] {
        var answers = testQuestions[currentQuestionIndex].incorrectAnswers.shuffled()
        answers = Array(answers.prefix(2)) // Берем только два случайных неправильных ответа
        answers.append(testQuestions[currentQuestionIndex].answer) // Добавляем правильный ответ
        return answers.shuffled() // Перемешиваем все три ответа
    }
    
    private func handleAnswerSelection(_ answer: String) {
        selectedAnswer = answer
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            if self.currentQuestionIndex < self.testQuestions.count - 1 {
                self.currentQuestionIndex += 1
            }
        }
    }
    
    private func buttonBackgroundColor(for answer: String) -> Color {
        if let selectedAnswer = selectedAnswer {
            if answer == testQuestions[currentQuestionIndex].answer {
                return .green // Правильный ответ
            } else if answer == selectedAnswer {
                return .red // Неправильный выбранный ответ
            }
        }
        return .blue // Кнопки по умолчанию
    }
    
    private func resetState() {
        selectedAnswer = nil
    }
    
    private func restartTest() {
        testQuestions = questionViewModel.questions.shuffled()
        currentQuestionIndex = 0
        resetState()
    }
}

// MARK: - Preview
#Preview {
    QuestionTestView()
        .environmentObject(QuestionViewModel())
}
