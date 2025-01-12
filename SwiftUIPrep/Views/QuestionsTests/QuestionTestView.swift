//
//  QuestionTestView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI


struct QuestionTestView: View {
    let questionCount: Int
    let testDuration: Int
    
    @State private var questions: [Question] = [] // Массив настоящих вопросов
    @State private var currentQuestionIndex: Int = 0
    @State private var shuffledAnswers: [String] = []
    @State private var selectedAnswer: String? = nil
    @State private var timeRemaining: Int
    @State private var showResultView: Bool = false
    @State private var correctAnswers: Int = 0
    @State private var timer: Timer? = nil
    @State private var timeIsOver: Bool = false
    
    init(questionCount: Int = 5, testDuration: Int = 1) {
        self.questionCount = questionCount
        self.testDuration = testDuration
        self._timeRemaining = State(initialValue: testDuration * 60)
    }
    
    var body: some View {
        VStack {
            if showResultView {
                ResultTestView(correctAnswers: correctAnswers, totalQuestions: questionCount, timeRanOut: timeIsOver)
            } else {
                VStack(spacing: 20) {
                    // Таймер
                    Text("Time Remaining: \(timeString(from: timeRemaining))")
                        .font(.headline)
                    
                    // Прогресс
                    Text("Question \(currentQuestionIndex + 1) of \(questionCount)")
                        .font(.subheadline)
                    
                    // Вопрос
                    if currentQuestionIndex < questions.count {
                        Text(questions[currentQuestionIndex].question)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    
                    // Варианты ответа
                    ForEach(shuffledAnswers, id: \.self) { answer in
                        Button(action: {
                            handleAnswerSelection(answer)
                        }) {
                            Text(answer)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(buttonBackgroundColor(for: answer))
                                .cornerRadius(8)
                                .foregroundColor(.white)
                        }
                        .disabled(selectedAnswer != nil)
                    }
                    
                    Spacer()
                }
                .padding()
                .onAppear {
                    loadQuestions()
                    startTimer()
                }
                .onChange(of: currentQuestionIndex) { _ in
                    loadShuffledAnswers()
                }
            }
        }
        .padding()
    }
    
    // MARK: - Helper Functions
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate()
                timeIsOver = true
                showResultView = true
            }
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func loadQuestions() {
        // Здесь вы должны загрузить настоящие вопросы (например, из JSON)
        questions = QuestionViewModel().questions.shuffled() // Подгружаем и перемешиваем
        loadShuffledAnswers()
    }
    
    private func loadShuffledAnswers() {
        guard currentQuestionIndex < questions.count else { return }
        let currentQuestion = questions[currentQuestionIndex]
        
        // Берем правильный ответ и два случайных неправильных ответа
        var answers = currentQuestion.incorrectAnswers.shuffled().prefix(2).map { $0 }
        answers.append(currentQuestion.answer)
        shuffledAnswers = answers.shuffled() // Перемешиваем ответы
    }
    
    private func handleAnswerSelection(_ answer: String) {
        selectedAnswer = answer
        
        if answer == questions[currentQuestionIndex].answer {
            correctAnswers += 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if currentQuestionIndex < questionCount - 1 {
                currentQuestionIndex += 1
                selectedAnswer = nil
            } else {
                stopTimer()
                showResultView = true
            }
        }
    }
    
    private func buttonBackgroundColor(for answer: String) -> Color {
        if let selectedAnswer = selectedAnswer {
            if answer == questions[currentQuestionIndex].answer {
                return .green
            } else if answer == selectedAnswer {
                return .red
            }
        }
        return .blue
    }
}

// MARK: - Preview
#Preview {
    QuestionTestView()
        .environmentObject(QuestionViewModel())
}
