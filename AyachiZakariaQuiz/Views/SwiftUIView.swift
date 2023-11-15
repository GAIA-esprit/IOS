//
//  SwiftUIView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 12/11/2023.
//

import SwiftUI
import AVKit

struct SwiftUIView: View {
    @State private var showDetails = false
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                }
            GIFView(type: .name("sealpup-seal"))
                  .frame(maxHeight: 300)
                  .padding()
       }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
