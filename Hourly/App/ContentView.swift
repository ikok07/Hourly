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
    
    let timerController = TimerController()
    
    @State private var openedTimer: Bool = false
    @Query(filter: #Predicate<CustomTimer> { $0.isActive == true }) private var timers: [CustomTimer]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(timers) { timer in
                        TimerRowView(timer: timer)
                            .task {
                                timerController.startTimer(timer)
                            }
                    }
                    .onDelete(perform: { indexSet in
                        if let index = indexSet.first {
                            context.delete(timers[index])
                        }
                    })
                }
                .listStyle(.plain)
                .transition(.slide)
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
