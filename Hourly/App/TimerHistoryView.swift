//
//  TimerHistoryView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 13.08.23.
//

import SwiftUI
import SwiftData

struct TimerHistoryView: View {
    
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<CustomTimer> { $0.isActive == false }) private var timers: [CustomTimer]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(timers) { timer in
                        HistoryTimerRowView(timer: timer)
                    }
                    .onDelete(perform: { indexSet in
                        if let index = indexSet.first {
                            context.delete(timers[index])
                        }
                    })
                }
                .listStyle(.plain)
            }
            .navigationTitle("History")
        }
        .padding()
    }
}

#Preview {
    TimerHistoryView()
    
}
