//
//  CardsGame.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 6/11/2023.
//

import SwiftUI

struct CardsGame: View {
    private var cards: [Card] = [
        Card(id: "1", image: "1", recyclable: false),
        Card(id: "2", image: "2", recyclable: true),
        Card(id: "3", image: "3", recyclable: true),
        Card(id: "4", image: "4", recyclable: true),
        Card(id: "5", image: "5", recyclable: true),
        Card(id: "6", image: "6", recyclable: true),
        Card(id: "7", image: "7", recyclable: true),
        Card(id: "8", image: "8", recyclable: true),
        Card(id: "9", image: "9", recyclable: true),
        Card(id: "10", image: "10", recyclable: true),
        Card(id: "11", image: "11", recyclable: true),
        Card(id: "12", image: "12", recyclable: true)
    ].reversed()

    @StateObject var swipeDirectionManager = SwipeDirectionManager()

    var body: some View {
        VStack {
            Text("Swipe in the right direction")
                .lilacTitle()
            Text("Which is recyclable")
                .lilacTitle()
            ZStack {
                ForEach(cards, id: \.id) { card in
                    CardView(card: card)
                        .environmentObject(swipeDirectionManager)
                        .onAppear {
                            if let swipeDirection = swipeDirectionManager.swipeDirection {
                                print("Initial swipe direction: \(swipeDirection)")
                            }
                        }
                }
            }
        }
    }
}


struct CardsGame_Previews: PreviewProvider {
    static var previews: some View {
        CardsGame()
    }
}
