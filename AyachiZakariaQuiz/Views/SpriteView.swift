//
//  SpriteView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 19/11/2023.
//

import SwiftUI

struct SpriteView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50) // Adjust the size as needed
    }
}
