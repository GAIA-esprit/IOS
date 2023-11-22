//
//  GameViewModel.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var quizzes: [Quiz] = []
    @Published var quizViewModel = QuizViewModel()
    @Published var currentQuestionIndex: Int = 0
    @Published var score: Int = 0
    @Published var timer: Timer?
    @Published var timeRemaining: Int = 10 // Initial time (in seconds)
    @Published var isGameOver: Bool = false

    // Fetch quizzes from the API
    func fetchQuizzes(difficulty: String, number: Int) {
        // Make a network request to fetch quizzes based on difficulty and number
        // Update the 'quizzes' property with the fetched data
        // You can use URLSession or a networking library for this
        // For simplicity, let's assume you have a Quiz struct to model the data
    }

    // Start the game
    func startGame() {
        fetchQuizzes(difficulty: "easy", number: 5) // Adjust difficulty and number as needed
        startTimer()
    }

    // Check the user's answer and move to the next question
    func checkAnswer(selectedAnswer: String) {
        let currentQuiz = quizzes[currentQuestionIndex]

        if selectedAnswer == currentQuiz.correct_answer {
            score += 1
        }

        nextQuestion()
    }

    // Move to the next question
    func nextQuestion() {
        if currentQuestionIndex < quizzes.count - 1 {
            currentQuestionIndex += 1
        } else {
            endGame()
        }
    }

    // Start the timer
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }

            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.endGame()
            }
        }
    }

    // End the game
    func endGame() {
        timer?.invalidate()
        isGameOver = true
        // Handle end-of-game logic (e.g., show final score, reset game, etc.)
    }
}
