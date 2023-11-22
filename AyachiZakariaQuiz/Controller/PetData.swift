//
//  PetData.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 12/11/2023.
//

import Foundation

class PetData {
    private var PET_KEY = "PET_KEY"
    private var pet: Pet
    
    init() {
        if let data = UserDefaults.standard.data(forKey: PET_KEY){
            if let decoded = try? JSONDecoder().decode(Pet.self, from: data) {
                self.pet = decoded
                print("pet data received")
                return
            }
        }
        self.pet = Pet(name: "test", lastMeal: Date(), lastDrink: Date())
    }
    func loadData() -> Pet {
        return self.pet
    }
    func saveData(pet: Pet){
        if let encoded = try? JSONEncoder().encode(pet) {
            UserDefaults.standard.set(encoded, forKey: PET_KEY)
            
            print("data saved at: \(Date().formatted(date: .omitted, time: .standard))")
        }
    }
}
