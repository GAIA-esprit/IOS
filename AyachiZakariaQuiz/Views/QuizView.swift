//
//  QuizView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import SwiftUI

struct QuizView: View {
    @ObservedObject var quizViewModel = QuizViewModel()

    var body: some View {
        VStack {
            TextField("Type", text: $quizViewModel.type)
                .padding()
            TextField("Difficulty", text: $quizViewModel.difficulty)
                .padding()
            TextField("Category", text: $quizViewModel.category)
                .padding()
            TextField("Question", text: $quizViewModel.question)
                .padding()
            TextField("Correct Answer", text: $quizViewModel.correctAnswer)
                .padding()
            TextField("Incorrect Answers (comma-separated)", text: $quizViewModel.incorrectAnswers)
                .padding()

            Button("Add Quiz") {
                quizViewModel.addQuiz { result in
                    switch result {
                    case .success(let quiz):
                        print("Quiz added successfully: \(quiz)")
                    case .failure(let error):
                        print("Error adding quiz: \(error.localizedDescription)")
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
