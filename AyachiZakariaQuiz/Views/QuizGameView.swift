//
//  QuizGameView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

    import SwiftUI
struct QuizGameView: View {
    @ObservedObject var viewModel: QuizModelView
    @AppStorage("diff") private var diff = "easy"
    var body: some View {
        VStack {
            if (viewModel.gameover == 0)
            {
                ProgressBar(progress: CGFloat(viewModel.timeRemaining)*30)
                Text("Score: \(viewModel.score)")
                Text("Time: \(viewModel.timeRemaining)")

                if viewModel.quizzes.indices.contains(viewModel.currentQuizIndex) {
                    Text(viewModel.quizzes[viewModel.currentQuizIndex].question)
                        .padding()

                    ForEach(viewModel.quizzes[viewModel.currentQuizIndex].incorrect_answers + [viewModel.quizzes[viewModel.currentQuizIndex].correct_answer], id: \.self) { answer in
                        Button(action: {
                            viewModel.answerSelected(answer)
                        }) {
                            HStack(spacing: 20){
                                Text(answer)
                                    .padding()
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.green)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color ("AccentColor"))
                            .background(.white)
                        }
                    }
                } else {
                    Text("No quiz available.")
                }
            }
            else
            {
                VStack(spacing: 10){
                    Text("AAAAA")
                        .lilacTitle()
                    
                    Text("Mabrouk")
                    
                    Text("\(viewModel.score)")
                    
                    Button{
                        viewModel.resetGame()
                        
                    }label: {
                        PrimaryButton(text: "again")
                    }
                    
                    
                }
                .foregroundColor(Color("AccentColor"))
                .padding()
                .frame(maxWidth: .infinity,maxHeight: .infinity)
            }
            
        }
        .onAppear {
            viewModel.startGame(difficulty: diff, count: 3)
        }
    }
}
struct QuizGameView_Previews: PreviewProvider {
    static var previews: some View {
        QuizGameView(viewModel: QuizModelView())
    }
}
