//
//  TimerViewModel.swift
//  ARGame
//
//  Created by Rebecca Mello on 06/06/22.
//

import SwiftUI

//extension TimerStruct {
//    final class ViewModel: ObservableObject {
//        @Published var isActive = false
//        @Published var showingAlert = false
//        var time: String = "1:00"
//        var minutes: Int = 1 {
//            didSet {
//                self.time = "\(minutes):00"
//            }
//        }
//        private var initialTime = 0
//        private var endDate = Date()
//
//        init(min: Int) {
//            self.minutes = min
//        }
//
//        // Start the timer with the given amount of minutes
//        func start(minutes: Int) {
//            self.initialTime = minutes
//            self.endDate = Date()
//            self.isActive = true
//            self.endDate = Calendar.current.date(byAdding: .minute, value: minutes, to: endDate)!
//        }
//
//        // Show updates of the timer
//        func updateCountdown(){
//            guard isActive else { return }
//
//            // Gets the current date and makes the time difference calculation
//            let now = Date()
//            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
//
//            // Checks that the countdown is not <= 0
//            if diff <= 0 {
//                self.isActive = false
//                self.time = "0:00"
//                self.showingAlert = true
//                return
//            }
//
//            // Turns the time difference calculation into sensible data and formats it
//            let date = Date(timeIntervalSince1970: diff)
//            let calendar = Calendar.current
//            let minutes = calendar.component(.minute, from: date)
//            let seconds = calendar.component(.second, from: date)
//
//            // Updates the time string with the formatted time
//            self.minutes = minutes
//            self.time = String(format:"%d:%02d", minutes, seconds)
//        }
//    }
//}


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
