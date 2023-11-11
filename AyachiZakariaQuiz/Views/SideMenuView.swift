//
//  SideMenuView.swift
//  GAIA-Main
//
//  Created by Ayachi Zakaria on 11/11/2023.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isSowing: Bool
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.green,Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                //header
                SideMenuHeaderView(isShowing: $isSowing)
                    .foregroundColor(.white)
                    .frame(height: 240)
                
                
                //option
                ForEach(SideMenuViewModel.allCases, id: \.self) { option in
                    NavigationLink(destination: Text(option.title), label: {SideMenuOptionView(viewmodel: option)})
                }
                
                Spacer()
                
            }
        }.navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isSowing: .constant(true))
    }
}
