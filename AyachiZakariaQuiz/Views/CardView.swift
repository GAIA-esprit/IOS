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
    var card: String
    @State private var id = CGSize.zero
    @State private var offset = CGSize.zero
    @State private var color: Color = .clear
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 320, height: 490)
                .border(.white, width: 0.0)
                .cornerRadius(0)
                .foregroundColor(color.opacity(0.9))
                .shadow(radius: 4)
                .background(Image(card).resizable()
                    .scaledToFit())
            HStack{
                
                Image(systemName: "nosign.app.fill")
                    .foregroundColor(.red)
                Text(card)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
            
        }
        .offset(x: offset.width, y:offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation{
                        changeColor(width: offset.width)
                        
                    }
                    
                } .onEnded{ _ in
                    withAnimation{
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                }
        )
    }
    
    func swipeCard(width: CGFloat){
        switch width {
        case -500...(-150):
            if card == "1" {
                print("oi 1")
            }
            if card == "2" {
                print("oi 2")
            }
            if card == "3" {
                print("oi 3")
            }
            print("\(card) removed")
            swipeDirectionManager.swipeDirection = .left
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("\(card) added")
            swipeDirectionManager.swipeDirection = .right
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor (width: CGFloat)
    {
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
        CardView(card: "test")
    }
}
