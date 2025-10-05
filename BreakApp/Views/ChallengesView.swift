//
//  ChallengesView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct ChallengesView: View {
    @ObservedObject var viewModel: TimerViewModel

    var body: some View {
        VStack {
            ScrollView{
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Break Master",
                        description: "Take 50 breaks",
                        maxProgress: 50,
                        color: .yellow,
                        lockedImage: "seal",
                        unlockedImage: "seal.fill",
                        progressText: "breaks"
                    ),
                    currentProgress: $viewModel.breaksTakenTotal
                )
                
                AchievementDetailView(
                        achievement: Achievement(
                            title: "Break Lord",
                            description: "Spend 10 hours not working",
                            maxProgress: 600,
                            color: .yellow,
                            lockedImage: "crown",
                            unlockedImage: "crown.fill",
                            progressText: "minutes"
                        ),
                        currentProgress: $viewModel.timeSpentOnBreaksTotal
                    )
                
                AchievementDetailView(
                        achievement: Achievement(
                            title: "Pocket Money Fund",
                            description: "Earn $100 from taking breaks",
                            maxProgress: 100,
                            color: .green,
                            lockedImage: "dollarsign.circle",
                            unlockedImage: "dollarsign.circle.fill",
                            progressText: "€ earned"
                        ),
                        // This creates a read-only integer binding to viewModel.lifetimeEarnings.
                        //  I can use it in a UI control like a ProgressView or Slider, but moving the slider won’t change the underlying data because set does nothing.
                        //  The binding lets SwiftUI observe changes in viewModel.lifetimeEarnings if it’s a @Published property.
                        currentProgress: Binding<Int>(
                                get: { Int(viewModel.lifetimeEarnings) },
                                set: { _ in }
                            )
                        )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Triple Threat",
                        description: "Take 3 breaks in one day",
                        maxProgress: 100,
                        color: .green,
                        lockedImage: "dollarsign.circle",
                        unlockedImage: "dollarsign.circle.fill",
                        progressText: "€ earned"
                    ),
                    currentProgress: Binding<Int>(
                        get: { Int(viewModel.lifetimeEarnings) },
                        set: { _ in }
                    )
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Regular Royal",
                        description: "Take a break 5 days in a row",
                        maxProgress: 5,
                        color: .blue,
                        lockedImage: "calendar.circle",
                        unlockedImage: "calendar.circle.fill",
                        progressText: "day streak"
                    ),
                    currentProgress: Binding<Int>(
                        get: { Int(viewModel.lifetimeEarnings) },
                        set: { _ in }
                    )
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Break Champion",
                        description: "Earn $500 from breaks",
                        maxProgress: 500,
                        color: .green,
                        lockedImage: "dollarsign.square",
                        unlockedImage: "dollarsign.square.fill",
                        progressText: "€ earned"
                    ),
                    currentProgress: Binding<Int>(
                        get: { Int(viewModel.lifetimeEarnings) },
                        set: { _ in }
                    )
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Break Prodigy",
                        description: "Spend 24 hours on break",
                        maxProgress: 1440,
                        color: .blue,
                        lockedImage: "clock",
                        unlockedImage: "clock.fill",
                        progressText: "minutes"
                    ),
                    currentProgress: $viewModel.timeSpentOnBreaksTotal
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Break Professional",
                        description: "Take 100 breaks",
                        maxProgress: 100, color: .green,
                        lockedImage: "briefcase",
                        unlockedImage: "briefcase.fill",
                        progressText: "breaks"
                    ),
                    currentProgress: $viewModel.breaksTakenTotal
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Super Chiller",
                        description: "Take 5 breaks in one day",
                        maxProgress: 5,
                        color: .yellow,
                        lockedImage: "sparkles.rectangle.stack",
                        unlockedImage: "sparkles.square.filled.on.square",
                        progressText: "breaks today"
                    ),
                    currentProgress: $viewModel.breaksTakenToday
                )
                                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Break Tycoon",
                        description: "Earn $1000 from taking breaks",
                        maxProgress: 1000,
                        color: .green,
                        lockedImage: "crown",
                        unlockedImage: "crown.fill",
                        progressText: "€ earned"
                    ),
                    currentProgress: Binding<Int>(
                        get: { Int(viewModel.lifetimeEarnings) },
                        set: { _ in }
                    )
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Chill Warrior",
                        description: "Take a break every day for 7 days",
                        maxProgress: 7,
                        color: .yellow,
                        lockedImage: "shield",
                        unlockedImage: "shield.fill",
                        progressText: "day streak"
                    ),
                    currentProgress: $viewModel.daySteak
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Chill Millionaire",
                        description: "Earn $2000 from breaks",
                        maxProgress: 2000,
                        color: .green,
                        lockedImage: "dollarsign.circle",
                        unlockedImage: "dollarsign.circle.fill",
                        progressText: "€ earned"
                    ),
                    currentProgress: Binding<Int>(
                        get: { Int(viewModel.lifetimeEarnings) },
                        set: { _ in } 
                    )
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Legendary Office Worker",
                        description: "Take 500 breaks",
                        maxProgress: 500, color: .yellow,
                        lockedImage: "trophy",
                        unlockedImage: "true.fill",
                        progressText: "breaks"
                    ),
                    currentProgress: $viewModel.breaksTakenTotal
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Break Marathon",
                        description: "Spend 100 hours on break",
                        maxProgress: 500,
                        color: .blue,
                        lockedImage: "hourglass.circle",
                        unlockedImage: "hourglass.cirlce.fill",
                        progressText: "minutes"
                    ),
                    currentProgress: $viewModel.timeSpentOnBreaksTotal
                )
                
                AchievementDetailView(
                    achievement: Achievement(
                        title: "Daily Chiller",
                        description: "Take 10 breaks in one day",
                        maxProgress: 10,
                        color: .blue,
                        lockedImage: "10.square",
                        unlockedImage: "10.square.fill",
                        progressText: "breaks today"
                    ),
                    currentProgress: $viewModel.breaksTakenToday
                )
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.darkBackground)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ChallengesView(viewModel: TimerViewModel())
}
