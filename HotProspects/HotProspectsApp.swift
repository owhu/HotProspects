//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Oliver Hu on 8/6/24.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
