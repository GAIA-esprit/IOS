//
//  PrimaryButton.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var backgroung: Color = Color("AccentColor")
    var body: some View {
        Text(text)
        .foregroundColor(.white)
        .padding()
        .padding(.horizontal)
        .background(backgroung)
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
