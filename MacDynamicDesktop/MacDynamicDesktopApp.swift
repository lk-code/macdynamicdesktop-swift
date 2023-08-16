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
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
