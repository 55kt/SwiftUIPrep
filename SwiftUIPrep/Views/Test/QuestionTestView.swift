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
    @State private var isStopAlertPresented: Bool = false
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Inizializer
    init(questionCount: Int = 5) {
        self.questionCount = questionCount
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                // Background
                
                VStack {
                    if showResultView {
                        ResultTestView(correctAnswers: correctAnswers, totalQuestions: questionCount, timeElapsed: totalTimeElapsed)
                    } else {
                        // Timer
                        TimeRemainingHolder(timerManager: TimerManager(initialTime: totalTimeElapsed))
                        
                        VStack(spacing: 20) {
                            // ProgressLine
                            ProgressBarLine(currentQuestion: currentQuestionIndex + 1, totalQuestions: questionCount)
                            
                            // Question
                            if currentQuestionIndex < questions.count {
                                Text(questions[currentQuestionIndex].question)
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.white)
                            }// if
                            
                            // Question Answers
                            ForEach(shuffledAnswers, id: \.self) { answer in
                                AnswerCellButton(
                                    isCorrect: buttonBackground(for: answer),
                                    answerText: answer
                                ) {
                                    handleAnswerSelection(answer)
                                }
                                .disabled(selectedAnswer != nil)
                            }// ForEach
                            
                            Spacer()
                        }// VStack
                        
                        .onAppear {
                            loadQuestions()
                            startTimer()
                        }// OnAppear
                        .onChange(of: currentQuestionIndex) { _ in
                            loadShuffledAnswers()
                        }
                        
                        .padding()
                        .onChange(of: currentQuestionIndex) { _ in
                            loadShuffledAnswers()
                        }// OnChange
                    }// if - else
                }// VStack
                .padding()
            }// ScrollView
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ToolbarButtons.stopTestButton(isStopAlertPresented: $isStopAlertPresented)
                }
            }
            .alert("Stop Test?", isPresented: $isStopAlertPresented) {
                Button("Cancel", role: .cancel) {}
                Button("Stop", role: .destructive) {
                    stopTimer()
                    resetTest()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        dismiss()
                    }
                }
            } message: {
                Text("Are you sure you want to stop the test? All progress will be lost.")
            }
        }// NavigationStack
    }// Body
    
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
        if questions.isEmpty {
            questions = QuestionViewModel().questions.shuffled()
            loadShuffledAnswers()
        }
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if currentQuestionIndex < questionCount - 1 {
                currentQuestionIndex += 1
                selectedAnswer = nil
            } else {
                resetTest()
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
    
    private func resetTest() {
        stopTimer()
        questions = []
        currentQuestionIndex = 0
        shuffledAnswers = []
        selectedAnswer = nil
        totalTimeElapsed = 0
        showResultView = false
        correctAnswers = 0
    }
    
}// View

// MARK: - Preview
#Preview {
    QuestionTestView()
        .environmentObject(QuestionViewModel())
}
