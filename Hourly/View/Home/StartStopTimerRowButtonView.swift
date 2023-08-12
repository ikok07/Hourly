//
//  StartStopTimerRowButtonView.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 12.08.23.
//

import SwiftUI

enum TimerState: CaseIterable {
    case play
    case pause
}

struct StartStopTimerRowButtonView: View {
    
    let state: TimerState
    
    var body: some View {
        Image(systemName: state == .play ? "play.fill" : "pause.fill")
            .font(.title3)
            .foregroundStyle(.cta)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .background(.cta.opacity(0.20))
            .cornerRadius(22)
    }
}

#Preview {
    StartStopTimerRowButtonView(state: .play)
}
