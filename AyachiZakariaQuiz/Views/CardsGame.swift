//
//  CardsGame.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 6/11/2023.
//

import SwiftUI

struct CardsGame: View {
    private var cards: [String] = ["1", "2", "3"].reversed()
    var body: some View {
        VStack{
            Text("Swipe in the right diretion")
                .lilacTitle()
            Text("which is recycable")
                .lilacTitle()
            ZStack{
                ForEach(cards, id: \.self) { card in
                    CardView(card: card)
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
