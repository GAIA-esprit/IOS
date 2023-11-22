//
//  QuizListViewModel.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import Foundation

class QuizListViewModel: ObservableObject {
    @Published var quizzes: [Quiz] = []

    func fetchQuizzes() {
        guard let url = URL(string: "http://localhost:3000/api/quiz/") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching quizzes: \(error.localizedDescription)")
            } else if let data = data {
                do {
                    let quizzes = try JSONDecoder().decode([Quiz].self, from: data)
                    DispatchQueue.main.async {
                        self.quizzes = quizzes
                    }
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
    }

    func deleteQuiz(at index: Int, completion: @escaping (Result<Void, Error>) -> Void) {
            guard index < quizzes.count else {
                print("Invalid index")
                return
            }

            let quizIdToDelete = quizzes[index].id // Assuming your Quiz model has an '_id' property

            guard let deleteUrl = URL(string: "http://localhost:3000/api/quiz/\(quizIdToDelete)") else {
                print("Invalid URL for deleting quiz")
                return
            }

            var request = URLRequest(url: deleteUrl)
            request.httpMethod = "DELETE"

            URLSession.shared.dataTask(with: request) { _, _, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    DispatchQueue.main.async {
                        self.quizzes.remove(at: index)
                        completion(.success(()))
                    }
                }
            }.resume()
        }
}
