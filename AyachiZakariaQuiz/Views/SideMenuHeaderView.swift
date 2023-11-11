//
//  SideMenuHeaderView.swift
//  GAIA-Main
//
//  Created by Ayachi Zakaria on 11/11/2023.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowing: Bool
    var body: some View {
        ZStack (alignment:.topTrailing){
            
            Button(action: {
                withAnimation(.spring()){
                    isShowing.toggle()
                }}, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            })
            VStack(alignment: .leading) {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("user")
                    .font(.system(size: 24, weight: .semibold))
                Text("@username")
                    .font(.system(size: 14))
                    .padding(.bottom, 32)
                HStack (spacing: 12){
                    HStack(spacing: 4){
                        Text("1111").bold()
                        Text("Following")
                    }
                    HStack(spacing: 4){
                        Text("604").bold()
                        Text("Followers")
                    }
                    Spacer()
                }
                
                Spacer()
            }.padding()
        }
    }
}
