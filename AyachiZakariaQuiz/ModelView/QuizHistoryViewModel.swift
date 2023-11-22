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

}
