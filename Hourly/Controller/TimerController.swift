//
//  TimerController.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 13.08.23.
//

import Foundation
import SwiftUI

class TimerController {
    
    func startTimer(_ customTimer: CustomTimer) {
        let deadline = customTimer.deadline
        var timer = Timer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let currentDate = Date()
            
            let allSecondsLeft = deadline.timeIntervalSince1970 - currentDate.timeIntervalSince1970
            if allSecondsLeft > 0 {
                let onlySecondsLeft = allSecondsLeft - Double(Int(allSecondsLeft / 60)) * 60
                
                let hoursLeftString = String(format: "%02d", Int(allSecondsLeft / 60))
                let secondsLeftString = String(format: "%02d", Int(onlySecondsLeft))
                
                customTimer.timeLeft = "\(hoursLeftString):\(secondsLeftString)"
            } else {
                customTimer.isActive = false
                stopTimer()
            }
        }

        func stopTimer() {
            timer.invalidate()
        }
        
    }
    
}
