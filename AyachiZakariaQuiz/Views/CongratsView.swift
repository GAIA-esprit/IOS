//
//  CongratsView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 22/11/2023.
//

import SwiftUI

struct CongratsView: View {
    @Binding var score: Int
    var onClose: () -> Void

    var body: some View {
        VStack {
            Text("Congratulations!")
                .font(.title)
                .padding()

            Text("You've successfully sorted all items!")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()

            Text("Score: \(score)")
                .font(.headline)
                .padding()

            Button(action: {
                onClose()
            }) {
                Text("Close")
            }
            .padding()
        }
        .background(Color.green.opacity(0.8))
        .cornerRadius(10)
        .padding()
    }
}


struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView(score: .constant(10), onClose: {})
    }
}
