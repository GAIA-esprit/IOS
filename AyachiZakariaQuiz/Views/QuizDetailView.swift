//
//  QuizDetailView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import SwiftUI

struct QuizDetailView: View {
    var quiz: Quiz

    var body: some View {
        VStack {
            Text("Question: \(quiz.question)")
            Text("Type: \(quiz.type)")
            Text("Difficulty: \(quiz.difficulty)")
            Text("Category: \(quiz.category)")
            Text("Correct Answer: \(quiz.correct_answer)")
            Text("Incorrect Answers: \(quiz.incorrect_answers.joined(separator: ", "))")
        }
        .navigationBarTitle("Quiz Detail")
    }
}

struct QuizDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleQuiz = Quiz(type: "multiple", difficulty: "hard", category: "Math: Computers", question: "What does CPU stand for?", correct_answer: "Central Processing Unit", incorrect_answers: ["Central Process Unit", "Computer Personal Unit", "Central Processor Unit"])
        return QuizDetailView(quiz: exampleQuiz)
    }
}
