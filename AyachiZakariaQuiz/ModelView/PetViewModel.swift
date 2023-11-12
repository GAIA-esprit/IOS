//
//  PetViewModel.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 12/11/2023.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject{
        @Published var pet: Pet
        private var repository = PetData()
        
        init() {
            pet = repository.loadData()
        }
        
        func saveData(){
            objectWillChange.send()
            repository.saveData(pet: pet)
        }
        func feed(){
            pet.lastMeal = Date()
            saveData()
        }
        func givewater(){
            pet.lastDrink = Date()
            saveData()
        }
    }
}
