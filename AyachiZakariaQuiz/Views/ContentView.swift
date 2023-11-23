

///
//  ContentView.swift
//  GAIA-Main
//
//  Created by Ayachi Zakaria on 11/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var isShowing = false

    var body: some View {
        NavigationView {
            ZStack {
                if isShowing {
                    SideMenuView(isShowing: $isShowing)
                }
                HomeView(isShowing: $isShowing)
                    .cornerRadius(isShowing ? 20 : 10)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring()) {
                            isShowing.toggle()
                        }
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.green)
                    }))
                    .navigationBarTitleDisplayMode(.automatic)
                    .navigationBarBackButtonHidden(true)
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct HomeView: View {
    @Binding var isShowing: Bool
    @State private var selectedTab: Tab = .house
    
    init(isShowing: Binding<Bool>) {
        _isShowing = isShowing
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            // Your home view content goes here

        }
        .navigationBarBackButtonHidden(true)
        .offset(x: isShowing ? 300 : 0, y: isShowing ? 44 : 0)
        .scaleEffect(isShowing ? 0.8 : 1)
    }
}

