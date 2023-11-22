//
//  QuizGameView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import SwiftUI

struct QuizGameView: View {
    @ObservedObject var viewModel: QuizModelView
    @State private var selectedAnswer: String?
    @State private var shakeAnimation = false
    @State private var isGridView = false
    let difficulty: String

    var body: some View {
        VStack {
            Toggle("Grid View", isOn: $isGridView)
                .padding()

            if viewModel.gameover == 0 {
                ProgressBar(progress: CGFloat(viewModel.timeRemaining) * 30)
                Text("Score: \(viewModel.score)")
                    .foregroundColor(Color("AccentColor"))
                Text("Time: \(viewModel.timeRemaining)")
                    .foregroundColor(Color("AccentColor"))

                if viewModel.quizzes.indices.contains(viewModel.currentQuizIndex) {
                    ScrollView {
                        if isGridView {
                            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 10) {
                                ForEach(viewModel.quizzes[viewModel.currentQuizIndex].incorrect_answers + [viewModel.quizzes[viewModel.currentQuizIndex].correct_answer], id: \.self) { answer in
                                    createButton(answer)
                                        .frame(height: 80) // Set a fixed height for each cell
                                }
                            }
                            .padding()
                        } else {
                            VStack {
                                Text(viewModel.quizzes[viewModel.currentQuizIndex].question)
                                    .padding()

                                ForEach(viewModel.quizzes[viewModel.currentQuizIndex].incorrect_answers + [viewModel.quizzes[viewModel.currentQuizIndex].correct_answer], id: \.self) { answer in
                                    createButton(answer)
                                }
                            }
                        }
                    }
                } else {
                    Text("No quiz available.")
                        .foregroundColor(Color("AccentColor"))
                }
            } else {
                VStack(spacing: 10) {
                    Text("Good Job")
                        .lilacTitle()

                    Text("you answered")

                    Text("\(viewModel.score)")
                    
                    Text("Question write")
                    if (viewModel.score > 5)
                    {
                        Text("Not bad")
                        GIFView(type: .url(URL(string: "http://localhost:3000/gifs/congrats.gif")!))
                    }
                    else
                    {
                        Text("You will do better next time")
                        GIFView(type: .url(URL(string: "http://localhost:3000/gifs/meh.gif")!))
                            .frame(width: 250, height: 150)
                    }

                    Button {
                        withAnimation {
                            viewModel.resetGame()
                        }
                    } label: {
                        PrimaryButton(text: "again")
                    }
                }
                .foregroundColor(Color("AccentColor"))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            viewModel.startGame(difficulty: difficulty, count: 3)
        }
    }

    private func createButton(_ answer: String) -> some View {
        Button(action: {
            withAnimation {
                selectedAnswer = answer
            }
            viewModel.answerSelected(answer)
        }) {
            HStack(spacing: 20) {
                Image(systemName: "circle.fill")
                    .font(.caption)
                Text(answer)
                    .padding()
                    .font(.system(size: 15)) // Set a smaller font size
                    .bold()
                    .lineLimit(nil) // Allow the text to wrap to the next line
                    .foregroundColor(selectedAnswer == answer ? .white : Color("AccentColor"))
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color("AccentColor"))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(selectedAnswer == answer ?
                          (answer == viewModel.quizzes[viewModel.currentQuizIndex].correct_answer ? Color.green : Color.red) :
                          Color.white
                    )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("AccentColor"), lineWidth: 2)
            )
            .opacity(1.0)
        }
    }
}

struct QuizGameView_Previews: PreviewProvider {
    static var previews: some View {
        QuizGameView(viewModel: QuizModelView(), difficulty: "easy")
    }
}
