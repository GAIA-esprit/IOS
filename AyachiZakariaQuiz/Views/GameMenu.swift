//
//  ContentView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import SwiftUI
import CoreData

struct GameMenu: View {
    @StateObject var triviaManager = TriviaManager()
    @State private var score = UserDefaults.standard.integer(forKey: "score")
    var body: some View {
        NavigationView {
            VStack(spacing: 40)
            {
                
                VStack(spacing: 20)
                {
                    Text("Your score is:")
                        .lilacTitle()
                    Text("\(score)")
                        .lilacTitle()
                    Text("Quiz")
                        .lilacTitle()
                    Text("Are You Ready To Test Your Bio Knocwledge")
                        .foregroundColor(Color("AccentColor"))
                    
                }
                
                
                NavigationLink {
                    LevelsView()
                } label: {
                    PrimaryButton(text: "Let's go")
                }
                NavigationLink {
                    QuizHistoryView(viewModel: QuizHistoryViewModel())
                } label: {
                    PrimaryButton(text: "history")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(hue: 0.387, saturation: 0.056, brightness: 0.966))
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct GameMenu_Previews: PreviewProvider {
        static var previews: some View {
            GameMenu()
        }
    }
    
}
