//
//  LevelsView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 8/11/2023.
//

import SwiftUI

struct ContentCellView: View {
    @State private var color: Color = .yellow
    var level: Int = 1
    var isLast: Bool = false
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0) {
                    HStack {
                        Image(systemName: "leaf.circle.fill").frame(width: 150)
                            .font(.system(size: 150))
                            .foregroundColor(.green)
                        
                    }
                    if !isLast {
                        Rectangle().fill(Color.brown).frame(width: 5, height: 50, alignment: .center).padding(.leading, 75)//.offset(y: -10)
                    }
                }
    }
}

struct LevelsView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 1){
                ForEach((1...5).reversed(), id: \.self) {
                    ContentCellView(isLast: $0 == 1)
                    // isLast for not showing last line in last cell
                }
            }
        }.padding()
    }
}
struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
