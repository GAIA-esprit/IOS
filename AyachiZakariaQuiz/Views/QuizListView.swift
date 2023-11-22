//
//  QuizListView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import SwiftUI

struct QuizListView: View {
    @ObservedObject var quizListViewModel = QuizListViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(quizListViewModel.quizzes, id: \.id) { quiz in
                    NavigationLink(destination: QuizDetailView(quiz: quiz)) {
                        Text(quiz.question)
                    }
                }
                .onDelete { indexSet in
                    delete(at: indexSet)
                }
            }
            .navigationBarTitle("Quizzes")
            .navigationBarItems(trailing: Button(action: {
                quizListViewModel.fetchQuizzes()
            }) {
                Image(systemName: "arrow.clockwise")
            })
            .onAppear {
                quizListViewModel.fetchQuizzes()
            }
        }
    }

    private func delete(at indexSet: IndexSet) {
        indexSet.forEach { index in
            quizListViewModel.deleteQuiz(at: index) { result in
                switch result {
                case .success:
                    print("Quiz deleted successfully")
                case .failure(let error):
                    print("Error deleting quiz: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct QuizListView_Previews: PreviewProvider {
    static var previews: some View {
        QuizListView()
    }
}
