//
//  Extensions.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import Foundation
import SwiftUI

extension Text{
    func lilacTitle() -> some View{
        self
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}

