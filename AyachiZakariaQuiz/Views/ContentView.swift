

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
                if isShowing{
                    SideMenuView(isSowing: $isShowing)
                }
                HomeView()
                    .cornerRadius(isShowing ? 20 : 10)
                    .offset(x: isShowing ? 300: 0, y: isShowing ? 44 : 0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                .navigationBarItems(leading: Button(action:{
                    withAnimation(.spring()){
                        isShowing.toggle()
                    }
                }, label: {
                    Image(systemName: "list.bullet")
                        .foregroundColor(.green)
                }))
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.automatic)
            }
            //go back to home
            .onAppear{
                isShowing = false
            }
            
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}

struct HomeView: View {
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
