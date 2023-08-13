//
//  TimerDetailView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 13.08.23.
//

import SwiftUI
import SwiftData

struct TimerDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    let timer: CustomTimer
    
    func getPercentage() -> Double {
        let currentDate = Date()
        let creationDate = timer.creationDate
        let deadline = timer.deadline
        
        let timerTime = deadline.timeIntervalSince1970 - creationDate.timeIntervalSince1970
        let elapsedTime = currentDate.timeIntervalSince1970 - creationDate.timeIntervalSince1970
        let percentage = 1 - (elapsedTime / timerTime)
        print(percentage)
        if percentage < 0.06 {
            context.delete(timer)
            dismiss()
        }
        
        return percentage - 0.02
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack(spacing: 40) {
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 20)
                            .foregroundStyle(.secondary)
                            .frame(width: geometry.size.width * 0.8)
                        
                        Circle()
                            .trim(from: 0.0, to: getPercentage())
                            .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .foregroundStyle(.cta)
                            .frame(width: geometry.size.width * 0.8)
                            .rotationEffect(.degrees(-90))
                            .animation(.linear)
                        
                        VStack {
                            Text(timer.timeLeft ?? "00:00")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("Time left")
                                .foregroundStyle(.secondary)
                        }
                    }

                    Button(action: {
                        context.delete(timer)
                        dismiss()
                    }, label: {
                        Spacer()
                        Text("Delete")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                        Spacer()
                    })
                    .buttonStyle(.borderedProminent)

                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal)
                .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
                .navigationTitle(timer.name)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    TimerDetailView(timer: CustomTimer(name: "Test name", deadline: Date()))
}
