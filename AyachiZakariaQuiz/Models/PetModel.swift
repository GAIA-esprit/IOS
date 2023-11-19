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
        hunger == "Hungry" || thirst == "Thirsty" ? "Unhappy" : "Happy"
    }
    
    var hunger: String {
        let timeSince = calcTimeSince(data: lastMeal)
        var string = "hungry"
        switch timeSince {
            case 0..<30: string = "Satiated"
            case 30..<60: string = "Getting Hungry"
            case 60...: string = "Hungry"
            default : string = "haha"
        }
        
        return string
    }
    var thirst: String {
        let timeSince = calcTimeSince(data: lastDrink)
        var string = "thirst"
        switch timeSince {
            case 0..<30: string = "Satiated"
            case 30..<60: string = "Getting thirsty"
            case 60...: string = "Thirsty"
            default : string = "haha"
        }
        
        return string
    }
}
