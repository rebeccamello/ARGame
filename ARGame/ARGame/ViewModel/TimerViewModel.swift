//
//  TimerViewModel.swift
//  ARGame
//
//  Created by Rebecca Mello on 06/06/22.
//

import Foundation

extension TimerView {
    final class TimerViewModel: ObservableObject {
        @Published var isActive = false
        @Published var time: String = "00:00"
        @Published var minutes: Float = 5.0 {
            didSet{
                self.time = "\(Int(minutes)):00"
            }
        }
        
        private var initialTime = 0
        private var endDate = Date()
            
        func start(minutes: Float) {
            self.initialTime = Int(minutes)
            self.endDate = Date()
            self.isActive = true
            self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
        }
        
        func updateCountdown() {
            guard isActive else { return }
            
            let now = Date()
            let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
            
            if diff <= 0 {
                self.isActive = false
                self.time = "00:00"
                return
            }
            
            let date = Date(timeIntervalSince1970: diff)
            let calendar = Calendar.current
            let minutes = calendar.component(.minute, from: date)
            let seconds = calendar.component(.minute, from: date)
            
            self.minutes = Float(minutes)
            self.time = String(format: "%d:%02d", minutes, seconds)
        }
        
    }
}
