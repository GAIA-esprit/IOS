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
    @State private var isDarkMode = false

    var body: some View {
        NavigationView {
            VStack {
                Section() {
                    TextField("Name your pet", text: $vm.pet.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.vertical, 8)
                    PetStatusView(pet: vm.pet, isDarkMode: isDarkMode)
                        .frame(maxHeight: 300)
                        .padding()
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Age: \(vm.pet.age) seconds")
                        Text("Status: \(vm.pet.happinessLevel)")
                        Text("Hunger: \(vm.pet.hunger)")
                        Text("Thirst: \(vm.pet.thirst)")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.7)))
                    .cornerRadius(10)
                    .padding()
                }

                Section(header: Text("Actions")) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        PetActionButton(action: vm.feed, title: "Feed", emoji: "🐟", isAvailable: vm.pet.hunger == "Hungry")
                        PetActionButton(action: vm.givewater, title: "Give Water", emoji: "💧", isAvailable: vm.pet.thirst == "Thirsty")
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }
            }
            .padding()
            .background(isDarkMode ? Image("night") : Image("cloud"))
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
            .overlay(
                Button(action: {
                    withAnimation {
                        isDarkMode.toggle()
                    }
                }) {
                    Image(systemName: isDarkMode ? "moon.circle.fill" : "sun.max.fill")
                        .foregroundColor(isDarkMode ? .white : .black)
                        .font(.title)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .topTrailing)
            )
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct PetActionButton: View {
    var action: () -> Void
    var title: String
    var emoji: String
    var isAvailable: Bool

    var body: some View {
        Button(action: {
            action()
            // Provide feedback here if needed
        }) {
            VStack {
                Text(emoji)
                    .font(.system(size: 40))
                    .padding()
                    .foregroundColor(.white)
                    .background(isAvailable ? Color.green : Color.gray)
                    .clipShape(Circle())
                    .shadow(radius: 5)

                Text(title)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .padding(.top, 4)
            }
        }
        .disabled(!isAvailable)
    }
}

struct PetStatusView: View {
    var pet: Pet
    var isDarkMode: Bool

    var body: some View {
        Group {
            if isDarkMode{
                if pet.hunger == "Getting Hungry" || pet.thirst == "Getting thirsty" {
                    GIFView(type: .url(URL(string: "http://localhost:3000/gifs/lay.gif")!))
                } else if pet.happinessLevel == "Happy" {
                    GIFView(type: .url(URL(string: "http://localhost:3000/gifs/happy.gif")!))
                } else {
                    GIFView(type: .url(URL(string: "http://localhost:3000/gifs/sad.gif")!))
                }
            }
            else
            {
                if pet.hunger == "Getting Hungry" || pet.thirst == "Getting thirsty" {
                    GIFView(type: .url(URL(string: "http://localhost:3000/gifs/beg.gif")!))
                } else if pet.happinessLevel == "Happy" {
                    GIFView(type: .url(URL(string: "http://localhost:3000/gifs/idle.gif")!))
                } else {
                    GIFView(type: .url(URL(string: "http://localhost:3000/gifs/sad.gif")!))
                }
            }
        }
        .frame(maxHeight: 300)
        .frame(width: 200, height: 200)
    }
}

struct PetView_Previews: PreviewProvider {
    static var previews: some View {
        PetView()
    }
}
