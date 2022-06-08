//
//  TimerViewModel.swift
//  ARGame
//
//  Created by Rebecca Mello on 06/06/22.
//

import SwiftUI

final class TimerViewModel: ObservableObject {
    @Published private var time: TimeInterval
    @Published var timeEnded = false
    
    private lazy var formatter: DateComponentsFormatter = {
        var form = DateComponentsFormatter()
        form.allowedUnits = [.minute, .second]
        form.unitsStyle = .positional
        form.zeroFormattingBehavior = .pad
        return form
    }()
    
    var formatedTime: String {
        formatter.string(from: time) ?? "00:00"
    }
    
    var timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    
    init(initialTime: TimeInterval) {
        self.time = initialTime
    }
    
    func update(date: Date) {
        if time > 0 {
            self.time -= 1
        } else {
            self.timeEnded = true
        }
    }
}
