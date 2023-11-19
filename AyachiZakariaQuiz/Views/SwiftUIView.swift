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
        
        GIFView(type: .url(URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExNGVheGcwdjJ5b29wMjBzNTg2ejNkaGJ1cmtnM28zbnI1emYyMmFhNSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/LNt1pkEoZdNUfvYJU9/source.gif")!))
            .frame(maxHeight: 300)
            .padding()
        
        
       }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
