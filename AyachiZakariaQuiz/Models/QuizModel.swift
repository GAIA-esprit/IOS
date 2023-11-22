//
//  QuizModel.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 21/11/2023.
//

import Foundation

struct QuizModel: Codable {
    let id: String
    let category: String
    let type: String
    let difficulty: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
}
