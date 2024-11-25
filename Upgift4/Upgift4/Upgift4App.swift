//
//  Upgift4App.swift
//  Upgift4
//
//  Created by Soniya Ghorbani on 2024-11-24.
//

import SwiftUI
import SwiftData

@main
struct Upgift4App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            TodoItem.self  // Define your model schema
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
                .modelContainer(sharedModelContainer)  // Pass the model container to the ContentView
        }
    }
}
