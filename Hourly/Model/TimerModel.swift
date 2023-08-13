//
//  TimerModel.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 12.08.23.
//

import Foundation
import SwiftData

@Model
class CustomTimer {
    let id: UUID
    let name: String
    let deadline: Date
    var timeLeft: String?
    var isActive: Bool
    
    init(name: String, deadline: Date) {
        self.id = UUID()
        self.name = name
        self.deadline = deadline
        self.isActive = true
    }
}
