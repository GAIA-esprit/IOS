//
//  Quiz.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 5/11/2023.
//

import Foundation
import SwiftUI

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool
    var quizWinningStatus: Bool = false
}
struct QuizModel {
    var question: String
    var answer: String
    var optionList: [QuizOption]
}
struct QuizOption {
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected: Bool = false
    var isMatched: Bool = false
}

