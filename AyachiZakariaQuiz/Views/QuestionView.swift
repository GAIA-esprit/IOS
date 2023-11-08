//
//  QuestionView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        VStack(spacing: 40)
        {
            HStack{
                Text("Trivia Game")
                    .lilacTitle()
                Spacer()
                Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressBar(progress: triviaManager.progress)
            VStack(alignment: .leading, spacing: 20){
                Text(triviaManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                ForEach(triviaManager.answerChoices, id: \.id){
                    answer in
                    AnswerRow(answer: answer)
                        .environmentObject(triviaManager)
                }

            }
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", backgroung: triviaManager.answerSelected ?
                              Color(.green) :
                                Color(hue: 1.0, saturation: 0.546, brightness: 0.327))
            }
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", backgroung: triviaManager.answerSelected ?
                              Color(.red) :
                                Color(hue: 1.0, saturation: 0.546, brightness: 0.327))
            }
            Spacer()
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.384, saturation: 0.054, brightness: 0.978))
        .navigationBarHidden(true)
        
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
