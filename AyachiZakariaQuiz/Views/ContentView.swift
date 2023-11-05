//
//  ContentView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40)
            {
                VStack(spacing: 20)
                {
                    Text("Quiz")
                        .lilacTitle()
                    Text("Are You Ready To Test Your Bio Knocwledge")
                        .foregroundColor(Color("AccentColor"))
                    
                }
                
                NavigationLink {
                    TriviaView()
                } label: {
                    PrimaryButton(text: "Let's go")
                }
                NavigationLink {
                    TimedQuizNavView()
                } label: {
                    PrimaryButton(text: "Game on")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color(hue: 0.387, saturation: 0.056, brightness: 0.966))
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
