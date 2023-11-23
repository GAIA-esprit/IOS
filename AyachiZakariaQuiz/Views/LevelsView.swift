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
            ForEach(pages.indices, id: \.self) { index in
                VStack {
                    Spacer()
                    PageView(page: pages[index])
                        .frame(height: 300) // Adjust the height as needed

                    Spacer()

                    NavigationLink(destination: destinationView(for: pages[index].tag)) {
                        PrimaryButton(text: "Go!!!!")
                    }
                    

                    Spacer()
                }
                .tag(index)
            }
        }
        .navigationBarBackButtonHidden(true)
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }

    private func destinationView(for tag: Int) -> some View {
        switch tag {
        case 0:
            return AnyView(LevelView())
        case 1:
            return AnyView(CardsGame())
        case 2:
            return AnyView(GarbageBinView())
        case 3:
            return AnyView(PetView())
        default:
            return AnyView(EmptyView())
        }
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
    }
}
