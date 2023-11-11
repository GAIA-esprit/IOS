

//
//  GameMenu.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 8/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .house
    init (){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack{
            VStack{
                TabView(selection: $selectedTab){
                    if selectedTab == .puzzlepiece
                    {
                        GameMenu()
                    }
                }
                
            }
            
            VStack{
                Spacer()
                
                ToolBar(selectedTab: $selectedTab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
