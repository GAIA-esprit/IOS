//
//  SideMenuViewModel.swift
//  GAIA-Main
//
//  Created by Ayachi Zakaria on 11/11/2023.
//

import Foundation

enum SideMenuViewModel: Int , CaseIterable{
    case profile
    case games
    
    var title: String{
        switch self {
        case .profile: return "Profile"
        case .games: return "Games"
        }
    }
    var imageName: String{
        switch self{
        case .profile: return "brain.head.profile"
        case .games: return "gamecontroller.fill"
        }
    }
}
