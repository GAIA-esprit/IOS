//
//  Answer.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import Foundation

struct Answer: Identifiable{
    var id = UUID() //randomid swift makes
    var text: AttributedString
    var isCorrect:Bool
}
