//
//  QuestionTestView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI


struct QuestionTestView: View {
    // MARK: - Properties
    let questionCount: Int
    
    @State private var questions: [Question] = []
    @State private var currentQuestionIndex: Int = 0
    @State private var shuffledAnswers: [String] = []
    @State private var selectedAnswer: String? = nil
    @State private var totalTimeElapsed: Int = 0 
    @State private var showResultView: Bool = false
    @State private var correctAnswers: Int = 0
    @State private var timer: Timer? = nil
    
    // MARK: - Inizializer
    init(questionCount: Int = 5) {
        self.questionCount = questionCount
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            if showResultView {
                ResultTestView(correctAnswers: correctAnswers, totalQuestions: questionCount, timeRanOut: true, timeElapsed: totalTimeElapsed)
            } else {
                // Таймер
                TimeRemainingHolder(timerManager: TimerManager(initialTime: totalTimeElapsed))
                
                VStack(spacing: 20) {
                    // Прогресс
                    ProgressBarLine(currentQuestion: currentQuestionIndex + 1, totalQuestions: questionCount)
                    
                    // Вопрос
                    if currentQuestionIndex < questions.count {
                        Text(questions[currentQuestionIndex].question)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                    }
                    
                    // Варианты ответа
                    ForEach(shuffledAnswers, id: \.self) { answer in
                        AnswerCellButton(
                            isCorrect: buttonBackground(for: answer),
                            answerText: answer
                        ) {
                            handleAnswerSelection(answer)
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
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            totalTimeElapsed += 1
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func loadQuestions() {
        questions = QuestionViewModel().questions.shuffled()
        loadShuffledAnswers()
    }
    
    private func loadShuffledAnswers() {
        guard currentQuestionIndex < questions.count else { return }
        let currentQuestion = questions[currentQuestionIndex]
        var answers = currentQuestion.incorrectAnswers.shuffled().prefix(2).map { $0 }
        answers.append(currentQuestion.answer)
        shuffledAnswers = answers.shuffled()
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
    
    private func buttonBackground(for answer: String) -> Bool? {
        if let selectedAnswer = selectedAnswer {
            if answer == questions[currentQuestionIndex].answer {
                return true
            } else if answer == selectedAnswer {
                return false
            }
        }
        return nil
    }
}

// MARK: - Preview
#Preview {
    QuestionTestView()
        .environmentObject(QuestionViewModel())
}
