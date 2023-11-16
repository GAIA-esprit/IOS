//
//  PetView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 12/11/2023.
//

import SwiftUI
import FLAnimatedImage

struct PetView: View {
    @StateObject private var vm = ViewModel()
    private var timer = Timer.publish(every: 15, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        ZStack{
            Form{
                Section("pet"){
                    TextField("Name your pet", text: $vm.pet.name)
                    if (vm.pet.happinessLevel == "Happy")
                    {
                        GIFView(type: .url(URL(string: "https://media.giphy.com/media/Dh5q0sShxgp13DwrvG/giphy.gif")!))
                            .frame(maxHeight: 300)
                            .padding()
                    }
                    else {
                        GIFView(type: .url(URL(string: "https://media.giphy.com/media/Dh5q0sShxgp13DwrvG/giphy.gif")!))
                            .frame(maxHeight: 300)
                            .padding()
                    }
                    
                    Image(vm.pet.happinessLevel == "Happy" ? "happy_pet" : "sad_seal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .centerH()
                    
                    Text("Age: **\(vm.pet.age)** seconds")
                    Text("Status: **\(vm.pet.happinessLevel)**")
                    Text("Hunger: **\(vm.pet.hunger)**")
                    Text("Thirst: **\(vm.pet.thirst)**")
                }
                Section("Actions"){
                    Button("🐟 Feed ", action : vm.feed)
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(40)
                        .shadow(radius: 10)
                    Button("💧Give Water", action : vm.givewater)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(40)
                        .shadow(radius: 10)
                }
            }
            
            .onReceive(timer){_ in
                vm.saveData()
            }
        }
        
    }
    
    struct PetView_Previews: PreviewProvider {
        static var previews: some View {
            PetView()
        }
    }
}
