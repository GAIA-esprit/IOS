//
//  CardView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 6/11/2023.
//

import SwiftUI

class SwipeDirectionManager: ObservableObject {
    @Published var swipeDirection: SwipeDirection?

    enum SwipeDirection {
        case left
        case right
    }
}
struct CardView: View {
    @EnvironmentObject var swipeDirectionManager: SwipeDirectionManager
    var card: Card
    @AppStorage("score") private var score = 0
    @State private var offset = CGSize.zero
    @State private var color: Color = .clear

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 320, height: 490)
                .foregroundColor(color.opacity(0.9))
                .shadow(radius: 4)
                .background(Image(card.image).resizable().scaledToFit())

            HStack {
                Image(systemName: "hand.thumbsdown.fill")
                    .foregroundColor(.red)
                    .imageScale(.large)
                Text(card.image)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.green)
                    .imageScale(.large) 
            }
        }
        .offset(x: offset.width, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                }
        )
    }

    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            if card.id == "1" {
                score -= 1
            }
            if card.id == "2" {
                score += 1
            }
            if card.id == "3" {
                score += 1
            }
            if card.id == "4" {
                score -= 1
            }
            if card.id == "5" {
                score -= 1
            }
            if card.id == "6" {
                score -= 1
            }
            if card.id == "7" {
                score -= 1
            }
            if card.id == "8" {
                score -= 1
            }
            if card.id == "9" {
                score += 1
            }
            if card.id == "10" {
                score += 1
            }
            if card.id == "11" {
                score += 1
            }
            if card.id == "12" {
                score += 1
            }
            print("\(score)")
            print("\(card.id) removed")
            swipeDirectionManager.swipeDirection = .left
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            if card.id == "1" {
                score += 1
            }
            if card.id == "2" {
                score -= 1
            }
            if card.id == "3" {
                score -= 1
            }
            if card.id == "4" {
                score += 1
            }
            if card.id == "5" {
                score += 1
            }
            if card.id == "6" {
                score += 1
            }
            if card.id == "7" {
                score += 1
            }
            if card.id == "8" {
                score -= 1
            }
            if card.id == "9" {
                score -= 1
            }
            if card.id == "10" {
                score -= 1
            }
            if card.id == "11" {
                score -= 1
            }
            if card.id == "12" {
                score -= 1
            }
            print("\(score)")
            print("\(card.id) added")
            swipeDirectionManager.swipeDirection = .right
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }

    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .clear
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: "test", image: "test", recyclable: false))
    }
}
