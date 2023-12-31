//
//  ColorThreeRandomApp.swift
//  ColorThreeRandom
//
//  Created by 平山奈々海 on 2023/12/04.
//

import SwiftUI
import SwiftData

@main
struct ColorThreeRandomApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Data.self,
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
            DataView()
        }
        .modelContainer(sharedModelContainer)
    }
}
