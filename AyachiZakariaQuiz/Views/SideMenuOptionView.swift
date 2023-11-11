//
//  SideMenuOptionView.swift
//  GAIA-Main
//
//  Created by Ayachi Zakaria on 11/11/2023.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewmodel: SideMenuViewModel
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewmodel.imageName)
                .frame(width: 24, height: 24)
            Text(viewmodel.title)
                .font(.system(size: 15, weight:.semibold))
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewmodel: .games)
    }
}
