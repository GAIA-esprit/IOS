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

    var body: some View {
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
