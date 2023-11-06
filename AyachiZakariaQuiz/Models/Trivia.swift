//
//  Trivia.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 6/11/2023.
//

import Foundation
struct Trivia: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable{
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correct_answer: String
        var incorrect_answers: [String]
        
        var formattedQuestion: AttributedString{
            do{
                return try AttributedString(markdown: question)
            }
            catch{
                print("error")
                return ""
            }
        }
        var answer: [Answer] {
            do{
                let corrects = [Answer(text: try AttributedString(markdown: correct_answer), isCorrect: true)]
                let incorrects =  try incorrect_answers.map{ answer in
                    Answer(text: try  AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = corrects + incorrects
                
                return allAnswers.shuffled()
            }
            catch{
                print("error")
                return []
            }
        }
    }
    
}
