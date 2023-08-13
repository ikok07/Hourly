//
//  HourlyApp.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 11.08.23.
//

import SwiftUI
import SwiftData

@main
struct HourlyApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: CustomTimer.self)
    }
}
