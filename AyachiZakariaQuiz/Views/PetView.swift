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
    @State var isFeedPressed = false
    @State var isWaterPressed = false
    private var timer = Timer.publish(every: 15, on: .main, in: .common)
        .autoconnect()
    var body: some View {
        ZStack{
            Form{
                Section("pet"){
                    TextField("Name your pet", text: $vm.pet.name)
                    if (vm.pet.hunger == "Getting Hungry" || vm.pet.thirst == "Getting thirsty")
                    {
                        GIFView(type: .url(URL(string: "https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExN2Y2cmJicTBkNjJvbWh5M3JmaDhzbXQ1aGR4MWg4MWpwZW1pMW9hcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/xXq2F1zuTF9dNwVMDP/giphy.gif")!))
                            .frame(maxHeight: 300)
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    else
                    if (vm.pet.happinessLevel == "Happy")
                    {
                        GIFView(type: .url(URL(string: "https://media.giphy.com/media/V9ZjMRndwPAQ90vkwz/giphy.gif")!))
                            .frame(maxHeight: 300)
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    else
                    {
                        GIFView(type: .url(URL(string: "https://media.giphy.com/media/zEvjvvAwBgAWXrLWW3/giphy.gif")!))
                            .frame(maxHeight: 300)
                            .frame(width: 200, height: 200)
                            .padding()
                    }
                    
                    Text("Age: **\(vm.pet.age)** seconds")
                    Text("Status: **\(vm.pet.happinessLevel)**")
                    Text("Hunger: **\(vm.pet.hunger)**")
                    Text("Thirst: **\(vm.pet.thirst)**")
                }
                Section("Actions"){
                    if (vm.pet.hunger == "Hungry" )
                    {
                        Button("🐟 ", action : vm.feed)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .background(.green)
                            .cornerRadius(40)
                            .shadow(radius: 10)
                            .font(.system(size: 60))
                        
                    }
                    if (vm.pet.thirst == "Thirsty" )
                    {
                        Button("💧", action : vm.givewater)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .background(.blue)
                            .cornerRadius(40)
                            .shadow(radius: 10)
                            .font(.system(size: 60))
                    }
                    
                    
                }
            }
            
            .onReceive(timer){_ in
                vm.saveData()
            }
        }
        .background(Image("cloud"))
        
    }
    
    struct PetView_Previews: PreviewProvider {
        static var previews: some View {
            PetView()
        }
    }
}
