//
//  ContentView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 11.08.23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var openedTimer: Bool = false
    @Query private var timers: [Timer]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(timers) { timer in
                        TimerRowView(timer: timer)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Timers")
            .toolbar {
                NavigationLink(destination: CreateTimerView()) {
                    Image(systemName: "plus")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
