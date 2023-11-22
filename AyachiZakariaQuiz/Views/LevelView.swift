//
//  LevelView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 19/11/2023.
//

import SwiftUI

struct Level: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var description: String
}

struct LevelView: View {
    @StateObject var triviaManager = TriviaManager()
    @State private var score = UserDefaults.standard.integer(forKey: "score")
    @State private var diff = UserDefaults.standard.integer(forKey: "diff")
    
    let levels: [Level] = [
        Level(name: "Easy", imageName: "easy", description: "How weak are you?"),
        Level(name: "Medium", imageName: "medium", description: "Still not impressed"),
        Level(name: "Hard", imageName: "hard", description: "Now we talkin.")
    ]

    @State private var selectedLevel: Level?

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 16) {
                    ForEach(levels) { level in
                        Button {
                            selectedLevel = level
                        } label: {
                            VStack(alignment: .leading) {
                                Image(level.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 2)
                                    )

                                Text(level.name)
                                    .font(.headline)
                                    .padding(.top, 8)

                                Text(level.description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding()
                            .background(Color(.systemBackground))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 8)
                    }
                }
                .padding()
            }
            .navigationTitle("Select a Difficulty")
            .sheet(item: $selectedLevel) { level in
                if (level.name == "Easy")
                {
                    
                    QuizGameView(viewModel: QuizModelView())
                }
                else
                if (level.name == "Medium")
                {
                    QuizGameView(viewModel: QuizModelView())
                }
                else
                if (level.name == "Hard")
                {
                    QuizGameView(viewModel: QuizModelView())
                }
                
            }
            
        .background(Color(hue: 0.387, saturation: 0.056, brightness: 0.966))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
    }
}
