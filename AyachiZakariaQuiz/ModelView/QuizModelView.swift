//
//  QuizModelView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import Foundation
import Combine

class QuizModelView: ObservableObject {
    @Published var quizzes: [Quiz] = []
    @Published var currentQuizIndex: Int = 0
    @Published var score: Int = 0
    @Published var timer: Timer?
    @Published var timeRemaining: Int = 50
    @Published var gameover: Int = 0 // Set your desired time limit
    let testUserID = "testUserID"

    func fetchQuizzes(difficulty: String, count: Int) {
            guard let url = URL(string: "http://localhost:3000/api/quiz/game/\(difficulty)/\(count)") else {
                print("Invalid URL")
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode([Quiz].self, from: data)

                    DispatchQueue.main.async {
                        self.quizzes = decodedData
                    }
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                }
            }.resume()
        }
    func startGame(difficulty: String, count: Int) {
        fetchQuizzes(difficulty: difficulty, count: count)
        resetGame()
        startTimer()
    }

    func resetGame() {
        currentQuizIndex = 0
        score = 0
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.nextQuestion()
            }
        }
    }

    func nextQuestion() {
        if currentQuizIndex < quizzes.count - 1 {
            currentQuizIndex += 1
            resetTimer()
        } else {
            endGame()
        }
    }

    func answerSelected(_ selectedAnswer: String) {
            if selectedAnswer == quizzes[currentQuizIndex].correct_answer {
                score += 1
            }

            // Call the method to add quiz history entry after answering a question
            addQuizHistory(quizID: quizzes[currentQuizIndex].id, selectedAnswer: selectedAnswer)

            nextQuestion()
        }
    func addQuizHistory(quizID: UUID, selectedAnswer: String) {
            // Convert UUID to String
            let quizIDString = quizID.uuidString
            
            // Make a network request to add quiz history entry
            // Replace this with your actual networking code
            let url = URL(string: "http://localhost:3000/api/quiz/history/add")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let body: [String: Any] = [
                "userID": testUserID, // Hardcoded user ID for testing
                "quizID": quizIDString,
                "selectedAnswer": selectedAnswer
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body)
            } catch {
                print("Error encoding request body: \(error)")
                return
            }

            URLSession.shared.dataTask(with: request) { _, _, error in
                if let error = error {
                    print("Error adding quiz history entry: \(error)")
                } else {
                    print("Quiz history entry added successfully")
                }
            }.resume()
        }
    func endGame() {
        timer?.invalidate()
        // Handle game end logic
        gameover = 1
    }

    func resetTimer() {
        timeRemaining = 10 // Reset to your desired time limit
    }
}
