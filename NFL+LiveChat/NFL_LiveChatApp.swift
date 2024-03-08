//
//  NFL_LiveChatApp.swift
//  NFL+LiveChat
//
//  Created by Lonzo Hamilton Jr on 3/8/24.
//

import SwiftUI
import SwiftData

@main
struct NFL_LiveChatApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
