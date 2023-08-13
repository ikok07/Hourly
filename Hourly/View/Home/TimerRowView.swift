//
//  TimerRowView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 12.08.23.
//

import SwiftUI

struct TimerRowView: View {
    
    let timer: CustomTimer
    
    var body: some View {
        HStack {
            Text(timer.name)
                .font(.title2)
                .padding(.trailing)
            Group {
                StartStopTimerRowButtonView(state: .pause)
            }
            Spacer()
            Group {
                Text(timer.timeLeft ?? "Starting..")
                    .font(.largeTitle)
                    .foregroundStyle(.cta)
            }
        }
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
    }
}

#Preview {
    TimerRowView(timer: CustomTimer(name: "Test timer", deadline: .now))
        .padding(.horizontal)
}
