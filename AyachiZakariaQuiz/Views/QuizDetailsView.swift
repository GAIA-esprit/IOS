//
//  QuizDetailsView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 23/11/2023.
//

import SwiftUI

struct QuizDetailsView: View {
    let quizId: String
    @ObservedObject var viewModel: QuizHistoryViewModel

    @State private var quizDetails: Quiz?

    var body: some View {
        VStack {
            if let quizDetails = quizDetails {
                Text("Quiz Details:")
                Text("Question: \(quizDetails.question)")
                // Display other quiz details as needed
            } else {
                Text("Loading...")
                    .onAppear {
                        viewModel.fetchQuizById(quizId: quizId) { result in
                            DispatchQueue.main.async {
                                self.quizDetails = result
                            }
                        }
                    }
            }
        }
        .navigationBarTitle("Quiz Details")
    }
}


struct QuizDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizDetailsView(quizId: "your_sample_quiz_id", viewModel: QuizHistoryViewModel())
    }
}
