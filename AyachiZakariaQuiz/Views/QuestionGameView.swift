//
//  QuestionGameView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//
import SwiftUI

struct QuestionGameView: View {
    @Binding var quiz: Quiz
    var onAnswerSelected: (String) -> Void

    var body: some View {
        VStack {
            Text(quiz.question)
                .padding()

            ForEach(quiz.incorrect_answers + [quiz.correct_answer], id: \.self) { answer in
                Button(action: {
                    onAnswerSelected(answer)
                }) {
                    Text(answer)
                        .padding()
                        .border(Color.black, width: 1)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}
