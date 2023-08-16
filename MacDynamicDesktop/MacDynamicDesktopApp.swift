//
//  MacDynamicDesktopApp.swift
//  MacDynamicDesktop
//
//  Created by Lars Krämer on 15.07.23.
//

import SwiftUI

@main
struct MacDynamicDesktopApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
