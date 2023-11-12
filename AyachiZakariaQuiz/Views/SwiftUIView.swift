//
//  SwiftUIView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 12/11/2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Text("test")
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.green)
                .frame(width: 150, height: 250))
        VStack{
            HStack{
                Text("test")
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(width: 150, height: 250))
                
                Text("test")
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(width: 150, height: 250))
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(.green)
                    .frame(width: 150, height: 250)
            }
            RoundedRectangle(cornerRadius: 10)
                .fill(.green)
                .frame(width: 150, height: 250)
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
