//
//  ToolBar.swift
//  GAIA
//
//  Created by Ayachi Zakaria on 8/11/2023.
//

import SwiftUI

enum Tab:String, CaseIterable{
    case house
    case person
    case puzzlepiece
    case gearshape
}

struct ToolBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String{
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color{
        switch selectedTab {
        case .house:
            return .blue
        case .person:
            return .red
        case .puzzlepiece:
            return .red
        case .gearshape:
            return .orange
        }
    }
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage :
                            tab.rawValue)
                    .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                    .foregroundColor(selectedTab == tab ? tabColor : .gray)
                    .font(.system(size: 22))
                    .onTapGesture{
                        withAnimation(.easeIn(duration: 0.1)){
                            selectedTab = tab
                        }
                    }
                    Spacer()
                }
                
            }
            .frame(width: .infinity, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
        }
    }
}

struct ToolBar_Previews: PreviewProvider {
    static var previews: some View {
        ToolBar(selectedTab: .constant(.house))
    }
}
