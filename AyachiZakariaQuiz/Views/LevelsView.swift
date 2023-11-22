//
//  LevelsView.swift
//  AyachiZakariaQuiz
//
//  Created by Ayachi Zakaria on 8/11/2023.
//

import SwiftUI

struct LevelsView: View {
    
    @StateObject var triviaManager = TriviaManager()
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages){ page in
                VStack{
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    if page.tag == 0 {
                        NavigationLink {
                            LevelView()
                        } label: {
                            PrimaryButton(text: "Go!!!!")
                        }
                        
                    }
                    else
                    if page.tag == 1{
                        NavigationLink {
                            CardsGame()
                        } label: {
                            PrimaryButton(text: "Go!!!!")
                        }
                        
                    }else
                    if page.tag == 2 {
                        NavigationLink {
                            GarbageBinView()
                        } label: {
                            PrimaryButton(text: "Go!!!!")
                        }
                        
                    }
                    else
                    if page.tag == 3
                    {
                        NavigationLink {
                            PetView()
                        } label: {
                            PrimaryButton(text: "Go!!!!")
                        }
                    }
                    Spacer()
                    
                }
            }
        }
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear{
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
}
struct GameMenu_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
