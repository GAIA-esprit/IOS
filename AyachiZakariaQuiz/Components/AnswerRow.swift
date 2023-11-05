//
//  AnswerRow.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    @State private var isSelected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected{
                Spacer()
                
                Image(systemName: answer.isCorrect ?
                    "checkmark.diamond.fill" :
                    "x.square.fill")
                .foregroundColor(answer.isCorrect ?
                                 green: red)
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(isSelected ?
                         Color("AccentColor"): .gray)
        .background(.white)
        .shadow(color: isSelected ? answer.isCorrect ? green : red :
            .gray, radius: 5, x:0.5, y:0.5)
        .onTapGesture {
            isSelected = true
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Koulha", isCorrect: false))
    }
}
