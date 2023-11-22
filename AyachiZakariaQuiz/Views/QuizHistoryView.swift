//
//  QuizHistoryView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 22/11/2023.
//

import SwiftUI

struct QuizHistoryView: View {
    @ObservedObject var viewModel: QuizHistoryViewModel

    var body: some View {
        NavigationView {
            List(viewModel.quizHistory) { historyEntry in
                VStack(alignment: .leading) {
                    Text("Quiz ID: \(historyEntry.quizID)")
                    Text("Selected Answer: \(historyEntry.selectedAnswer)")
                    Text("Timestamp: \(historyEntry.timestamp)")
                }
            }
            .navigationBarTitle("Quiz History")
        }
        .onAppear {
            viewModel.fetchQuizHistory()
        }
    }
}

struct QuizHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        QuizHistoryView(viewModel: QuizHistoryViewModel())
    }
}
