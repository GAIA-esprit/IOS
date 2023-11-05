//
//  QuestionView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack(spacing: 40)
        {
            HStack{
                Text("Trivia Game")
                    .lilacTitle()
                Spacer()
                Text("1 out of 30")
                
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressBar(progress: 200)
            VStack(alignment: .leading, spacing: 20){
                Text("Is a banana a cow?")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                AnswerRow(answer: Answer(text: "false", isCorrect: true))
                AnswerRow(answer: Answer(text: "true", isCorrect: false))
            }
            PrimaryButton(text: "Next")
            
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
    }
}
