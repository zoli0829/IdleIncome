//
//  TimerModel.swift
//  Poopy
//
//  Created by Zoltan Vegh on 02/10/2025.
//

import Foundation
import Combine

class TimerModel: ObservableObject {
    @Published var secondsElapsed: Int = 0
    @Published var totalSecondsElapsed: Int = 0
    @Published var earnedMoneyFromThisBreak: Double = 0
    @Published var earnedToday: Double = 0
    @Published var earnedThisWeek: Double = 0
    @Published var earnedThisMonth: Double = 0
    @Published var lifetimeEarnings: Double = 0
    
    var breaksTakenTotal: Int = 0 // take 50 breakes, take 100 breaks, take 500 breakes
    var minutesSpentOnBreak: Int = 0 // spend 10 hours on break,spend 24 hours, spend 100 hours on breaks
    var breaksTakenToday: Int = 0 // take 3 breaks in one day, take 5 breaks in one day, take 10 breaks per day
    var daySteak: Int = 0 // take breakes 5 days in a row, take a break every day for 7 days
    var timeSpentOnBreaksTotal: Int = 0
    
    @Published var isRunning = false
    private var task: Task<Void, Never>?
    
    var hourlyRate: Double = 25.0
    
    // MARK: Computed values
    var formattedTime: String {
        let minutes = secondsElapsed / 60
        let seconds = secondsElapsed % 60
        return String(format: "%02dm %02ds", minutes, seconds)
    }
    
    var formattedTotalTime: String {
        let minutes = totalSecondsElapsed / 60
        let seconds = totalSecondsElapsed % 60
        return String(format: "%02dm %02ds", minutes, seconds)
    }
    
    var earnedSalary: Double {
        (Double(secondsElapsed) / 3600.0) * hourlyRate
    }
    
    func startTimer() {
        guard !isRunning else { return }
        isRunning = true
        task = Task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(1))
                await MainActor.run {
                    self.secondsElapsed += 1
                    self.earnedMoneyFromThisBreak = self.earnedSalary
                }
            }
        }
    }
    
    func stopTimer() {
        isRunning = false
        task?.cancel()
        task = nil
    }
    
    func resetTimer() {
        stopTimer()
        secondsElapsed = 0
        earnedMoneyFromThisBreak = 0
    }
    
    func finishBreak() {
        let earned = earnedMoneyFromThisBreak
        earnedToday += earned
        earnedThisWeek += earned
        earnedThisMonth += earned
        lifetimeEarnings += earned
        
        breaksTakenTotal += 1
        breaksTakenToday += 1
        totalSecondsElapsed += secondsElapsed
        
        resetTimer()
    }
    
    // MARK: - Period resets
    func resetDailyIfNeeded() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastSaved = UserDefaults.standard.object(forKey: "lastDailyReset") as? Date ?? today
        
        if !Calendar.current.isDate(today, inSameDayAs: lastSaved) {
            earnedToday = 0
            breaksTakenToday = 0
            UserDefaults.standard.set(today, forKey: "lastDailyReset")
        }
    }
    
    func resetWeeklyIfNeeded() {
            let today = Date()
            let lastSaved = UserDefaults.standard.object(forKey: "lastWeeklyReset") as? Date ?? today
            
            if !Calendar.current.isDate(today, equalTo: lastSaved, toGranularity: .weekOfYear) {
                earnedThisWeek = 0
                UserDefaults.standard.set(today, forKey: "lastWeeklyReset")
            }
        }
        
        func resetMonthlyIfNeeded() {
            let today = Date()
            let lastSaved = UserDefaults.standard.object(forKey: "lastMonthlyReset") as? Date ?? today
            
            if !Calendar.current.isDate(today, equalTo: lastSaved, toGranularity: .month) {
                earnedThisMonth = 0
                UserDefaults.standard.set(today, forKey: "lastMonthlyReset")
            }
        }
    
    // call when the app starts
    func checkResets() {
        resetDailyIfNeeded()
        resetWeeklyIfNeeded()
        resetMonthlyIfNeeded()
    }
        
    // MARK: - Hard reset
    func eraseAllData() {
        resetTimer()
        earnedToday = 0
        earnedThisWeek = 0
        earnedThisMonth = 0
        lifetimeEarnings = 0
        breaksTakenTotal = 0
        minutesSpentOnBreak = 0
        breaksTakenToday = 0
        daySteak = 0
        totalSecondsElapsed = 0
    }
}
