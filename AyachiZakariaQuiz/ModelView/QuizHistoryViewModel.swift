//
//  QuizHistoryViewModel.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 22/11/2023.
//

import Foundation

class QuizHistoryViewModel: ObservableObject {
    @Published var quizHistory: [QuizHistoryEntry] = []
    private let userID = "testUserID" // Replace with your actual user ID

    func fetchQuizHistory() {
        let url = URL(string: "http://localhost:3000/api/quiz/history/\(userID)")!

        URLSession.shared.dataTask(with: url) { data, response, error in
            print("Data: \(String(describing: data))")
            print("Response: \(String(describing: response))")
            if let data = data {
                    let jsonString = String(data: data, encoding: .utf8)
                    print("Received JSON: \(String(describing: jsonString))")
                }
            if let error = error {
                print("Error fetching quiz history: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([QuizHistoryEntry].self, from: data)

                DispatchQueue.main.async {
                    self.quizHistory = decodedData
                }
            } catch {
                print("Error decoding quiz history: \(error)")
            }
                
        }.resume()
    }
    func fetchQuizById(quizId: String, completion: @escaping (Quiz?) -> Void) {
            guard let url = URL(string: "http://localhost:3000/api/quiz/\(quizId)") else {
                print("Invalid URL")
                completion(nil)
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                    completion(nil)
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Quiz.self, from: data)
                    completion(decodedData)
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                    completion(nil)
                }
            }.resume()
        }

}
