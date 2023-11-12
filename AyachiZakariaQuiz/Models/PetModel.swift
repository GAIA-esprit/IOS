//
//  PetModel.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 12/11/2023.
//

import Foundation


struct Pet: Codable {
    var name: String
    var birthday = Date ()
    var lastMeal: Date
    var lastDrink : Date
    
    var age: Int{
        let timeSince = calcTimeSince(data: birthday)
        return timeSince
    }
    
    var happinessLevel: String {
        hunger == "hungry" || thirst == "thirst" ? "Unhappy" : "happy"
    }
    
    var hunger: String {
        let timeSince = calcTimeSince(data: lastMeal)
        var string = "hungry"
        
        return string
    }
    var thirst: String {
        let timeSince = calcTimeSince(data: lastDrink)
        var string = "thirst"
        
        return string
    }
}
