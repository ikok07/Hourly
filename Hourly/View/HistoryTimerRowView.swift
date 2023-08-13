//
//  HistoryTimerRowView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 13.08.23.
//

import SwiftUI
import SwiftData

struct HistoryTimerRowView: View {
    
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<CustomTimer> { $0.isActive == false }) private var timers: [CustomTimer]
    
    let timer: CustomTimer
    
    func formatDeadline(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(timer.name)
                    .font(.title2)
                Text("Deadline: \(formatDeadline(date: timer.deadline))")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    context.delete(timer)
                }
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.cta)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 7, leading: 7, bottom: 7, trailing: 7))
                    .background(.cta.opacity(0.3))
                    .cornerRadius(15)
            })
            
        }
    }
}

#Preview {
    HistoryTimerRowView(timer: CustomTimer(name: "Test Timer", deadline: Date()))
        .padding(.horizontal)
}
