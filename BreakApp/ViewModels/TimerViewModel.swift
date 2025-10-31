//
//  TimerModel.swift
//  Poopy
//
//  Created by Zoltan Vegh on 02/10/2025.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    @Published var secondsElapsed: Int = 0
    @Published var totalSecondsElapsed: Int = 0 // need to save this every time the user closes the app and load it when the user opens it
    @Published var earnedMoneyFromThisBreak: Double = 0
    @Published var earnedToday: Double = 0
    @Published var earnedThisWeek: Double = 0
    @Published var earnedThisMonth: Double = 0
    @Published var lifetimeEarnings: Double = 0 // need to save this every time the user closes the app and load it when the user opens it
    
    var breaksTakenTotal: Int = 0
    var minutesSpentOnBreak: Int = 0
    var breaksTakenToday: Int = 0
    var daySteak: Int = 0
    var timeSpentOnBreaksTotal: Int = 0
    
    @Published var isRunning = false
    private var task: Task<Void, Never>?
    // background calc properties
    private var backgroundEnteredDate: Date?
    private var wasRunningBeforeBackground = false
    
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
     // MARK: Background and foreground logic
    func appMovedToBackground() {
        wasRunningBeforeBackground = isRunning
        if isRunning {
            backgroundEnteredDate = Date()
            // Suspend the timer task to avoid double counting
            stopTimer()
        }
    }
    
    func appMovedToForeground() {
        guard let backgroundDate = backgroundEnteredDate else { return }
        let secondsPassed = Int(Date().timeIntervalSince(backgroundDate))
        
        if wasRunningBeforeBackground {
                secondsElapsed += secondsPassed
                earnedMoneyFromThisBreak = earnedSalary
                startTimer()
            }

            backgroundEnteredDate = nil
            wasRunningBeforeBackground = false
    }
    
    // MARK: Timer functions
    func startTimer() {
        guard !isRunning else { return }
        isRunning = true
        task = Task {
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(1))
                await MainActor.run {
                    guard self.isRunning else { return } // prevent late tick
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
        secondsElapsed = 0
        earnedMoneyFromThisBreak = 0
    }
    
    func finishBreak() {
        stopTimer()
        
        let earned = earnedSalary
        earnedToday += earned
        earnedThisWeek += earned
        earnedThisMonth += earned
        lifetimeEarnings += earned
        
        breaksTakenTotal += 1
        breaksTakenToday += 1
        totalSecondsElapsed += secondsElapsed
        timeSpentOnBreaksTotal += secondsElapsed / 60
        
        updateDayStreak()
        // save totalSecondsElapsed and lifetimeEarnings
        saveTotalSecondsElapsed()
        saveLifetimeEarnings()
        saveEarnedTodayThisWeekThisMonth()
        saveEverythingElse()
                
        resetTimer()
    }
    
    // MARK: - Period resets
    func resetDailyIfNeeded() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastSaved = UserDefaults.standard.object(forKey: "lastDailyReset") as? Date ?? .distantPast
        
        if !Calendar.current.isDate(today, inSameDayAs: lastSaved) {
            earnedToday = 0
            breaksTakenToday = 0
            UserDefaults.standard.set(today, forKey: "lastDailyReset")
            saveEarnedTodayThisWeekThisMonth()
        }
    }
    
    func resetWeeklyIfNeeded() {
        let today = Date()
        let lastSaved = UserDefaults.standard.object(forKey: "lastWeeklyReset") as? Date ?? .distantPast

        if !Calendar.current.isDate(today, equalTo: lastSaved, toGranularity: .weekOfYear) {
            earnedThisWeek = 0
            UserDefaults.standard.set(today, forKey: "lastWeeklyReset")
            saveEarnedTodayThisWeekThisMonth()
        }
    }
        
    func resetMonthlyIfNeeded() {
        let today = Date()
        let lastSaved = UserDefaults.standard.object(forKey: "lastMonthlyReset") as? Date ?? .distantPast

        if !Calendar.current.isDate(today, equalTo: lastSaved, toGranularity: .month) {
            earnedThisMonth = 0
            UserDefaults.standard.set(today, forKey: "lastMonthlyReset")
            saveEarnedTodayThisWeekThisMonth()
        }
    }
    
    // MARK: Day streak tracking
    private func updateDayStreak() {
        let calendar = Calendar.current
        let todayStart = calendar.startOfDay(for: Date())

        let lastBreakDate = UserDefaults.standard.object(forKey: "lastBreakDate") as? Date
        let savedStreak = UserDefaults.standard.integer(forKey: "dayStreak")

        if let lastDate = lastBreakDate {
            if calendar.isDateInYesterday(lastDate) {
                // yesterday -> increment saved streak
                daySteak = max(1, savedStreak) + 1
            } else if calendar.isDate(lastDate, inSameDayAs: todayStart) {
                // already took a break today -> keep saved streak
                daySteak = savedStreak
            } else {
                // missed a day or gap -> reset streak to 1
                daySteak = 1
            }
        } else {
            // first ever break
            daySteak = 1
        }

        UserDefaults.standard.set(daySteak, forKey: "dayStreak")
        UserDefaults.standard.set(todayStart, forKey: "lastBreakDate")
    }
    
    // call in the onAppear()
    func checkResets() {
        resetDailyIfNeeded()
        resetWeeklyIfNeeded()
        resetMonthlyIfNeeded()
    }
    
    // call in the onAppear()
    func loadStreak() {
        daySteak = UserDefaults.standard.integer(forKey: "dayStreak")
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
    
    // MARK: Save and load total time and total earned
    func saveTotalSecondsElapsed() {
        UserDefaults.standard.set(totalSecondsElapsed, forKey: "totalSecondsElapsed")
    }
    
    func saveLifetimeEarnings() {
        UserDefaults.standard.set(lifetimeEarnings, forKey: "lifetimeEarnings")
    }
    
    func saveHourlyRate() {
        UserDefaults.standard.set(hourlyRate, forKey: "hourlyRate")
    }
    
    func saveEarnedTodayThisWeekThisMonth() {
        UserDefaults.standard.set(earnedToday, forKey: "earnedToday")
        UserDefaults.standard.set(earnedThisWeek, forKey: "earnedThisWeek")
        UserDefaults.standard.set(earnedThisMonth, forKey: "earnedThisMonth")
    }
    
    func saveEverythingElse() {
        UserDefaults.standard.set(breaksTakenTotal, forKey: "breaksTakenTotal")
        UserDefaults.standard.set(minutesSpentOnBreak, forKey: "minutesSpentOnBreak")
        UserDefaults.standard.set(breaksTakenToday, forKey: "breaksTakenToday")
        UserDefaults.standard.set(daySteak, forKey: "daySteak")
        UserDefaults.standard.set(timeSpentOnBreaksTotal, forKey: "timeSpentOnBreaksTotal")
    }
    
    func loadTotalSecondsElapsed() {
        totalSecondsElapsed = UserDefaults.standard.integer(forKey: "totalSecondsElapsed")
    }
    
    func loadLifetimeEarnings() {
        lifetimeEarnings = UserDefaults.standard.double(forKey: "lifetimeEarnings")
    }
    
    func loadHourlyRate() {
        let stored = UserDefaults.standard.double(forKey: "hourlyRate")
        if stored > 0 {
            hourlyRate = stored
        }
    }
    
    func loadEarnedTodayThisWeekThisMonth() {
        earnedToday = UserDefaults.standard.double(forKey: "earnedToday")
        earnedThisWeek = UserDefaults.standard.double(forKey: "earnedThisWeek")
        earnedThisMonth = UserDefaults.standard.double(forKey: "earnedThisMonth")
    }
    
    func loadEverythingElse() {
        breaksTakenTotal = UserDefaults.standard.integer(forKey: "breaksTakenTotal")
        minutesSpentOnBreak = UserDefaults.standard.integer(forKey: "minutesSpentOnBreak")
        breaksTakenToday = UserDefaults.standard.integer(forKey: "breaksTakenToday")
        daySteak = UserDefaults.standard.integer(forKey: "daySteak")
        timeSpentOnBreaksTotal = UserDefaults.standard.integer(forKey: "timeSpentOnBreaksTotal")
    }
}
