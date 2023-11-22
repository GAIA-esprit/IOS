//
//  QuizViewModel.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import Foundation

class QuizViewModel: ObservableObject {
    @Published var type = ""
    @Published var difficulty = ""
    @Published var category = ""
    @Published var question = ""
    @Published var correctAnswer = ""
    @Published var incorrectAnswers = ""

    func addQuiz(completion: @escaping (Result<Quiz, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/api/quiz/") else {
            print("Invalid URL")
            return
        }

        guard let incorrectAnswersArray = incorrectAnswers.components(separatedBy: ",") as? [String] else {
            print("Invalid Incorrect Answers format")
            return
        }

        let quizData: [String: Any] = [
            "type": type,
            "difficulty": difficulty,
            "category": category,
            "question": question,
            "correct_answer": correctAnswer,
            "incorrect_answers": incorrectAnswersArray
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: quizData)

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    do {
                        let quiz = try JSONDecoder().decode(Quiz.self, from: data)
                        completion(.success(quiz))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }.resume()

        } catch {
            completion(.failure(error))
        }
    }
}
