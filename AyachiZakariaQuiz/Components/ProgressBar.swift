//
//  ProgressBar.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 4)
                .foregroundColor(Color(hue: 0.268, saturation: 1.0, brightness: 0.551 , opacity: 0.327))
                .cornerRadius(10)
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
            
        }
    }
}
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 10)
    }
}
