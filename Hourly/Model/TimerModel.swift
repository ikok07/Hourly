//
//  TimerModel.swift
//  Hourly
//
//  Created by Kaloyan Petkov on 12.08.23.
//

import Foundation
import SwiftData

@Model
class Timer {
    let id: UUID
    let name: String
    let deadline: Date
    
    init(name: String, deadline: Date) {
        self.id = UUID()
        self.name = name
        self.deadline = deadline
    }
}
