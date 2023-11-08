//
//  TriviaView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        if triviaManager.reachedEnd{
            VStack(spacing: 10){
                Text("AAAAA")
                    .lilacTitle()
                
                Text("Mabrouk")
                
                Text("\(triviaManager.score)")
                
                Text("\(triviaManager.length)")
                Button{
                    Task.init{
                        await triviaManager.fetchTrivia()
                    }
                    
                }label: {
                    PrimaryButton(text: "again")
                }
                
                
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            
        }
        QuestionView()
            .environmentObject(triviaManager)
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
