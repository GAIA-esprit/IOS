//
//  haithemApp.swift
//  haithem
//
//  Created by Mac2021 on 6/11/2023.
//

import SwiftUI

@main
struct haithemApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
