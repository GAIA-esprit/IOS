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
    let levels: [Level] = [
        Level(name: "Easy", imageName: "easy", description: "A good starting point for beginners."),
        Level(name: "Medium", imageName: "medium", description: "A moderate challenge for experienced players."),
        Level(name: "Hard", imageName: "hard", description: "Only for the bravest and most skilled players.")
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
            .navigationTitle("Select Level")
            .sheet(item: $selectedLevel) { level in
                GameMenu()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
    }
}
