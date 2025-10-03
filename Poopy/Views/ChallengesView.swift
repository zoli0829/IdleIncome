//
//  ChallengesView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct ChallengesView: View {
    @ObservedObject var viewModel: TimerModel

    var body: some View {
        VStack {
            ScrollView{
                AchievementDetailView(achievemenTitle: "Break Master", achievementDescription: "Take 50 breaks", maxProgress: 50, currentProgress: viewModel.breaksTakenTotal, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks")
                
                AchievementDetailView(achievemenTitle: "Break Lord", achievementDescription: "Spend 10 hours not working", maxProgress: 600, currentProgress: viewModel.timeSpentOnBreaksTotal, color: .green, achievementImage: "person.fill", achievementTextToDisplay: "minutes")
                
                AchievementDetailView(achievemenTitle: "Pocket Money Fund", achievementDescription: "Earn 100$ from taking breaks", maxProgress: 100, currentProgress: Int(viewModel.lifetimeEarnings), color: .green, achievementImage: "person.fill", achievementTextToDisplay: "dollars")
                
                AchievementDetailView(achievemenTitle: "Triple Threat", achievementDescription: "Take 3 breaks in one day", maxProgress: 3, currentProgress: viewModel.breaksTakenToday, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks today")
                
                // TODO: need to introduce a streak var
                AchievementDetailView(achievemenTitle: "Regular Royal", achievementDescription: "Take a break 5 days in a row", maxProgress: 5, currentProgress: 0, color: .green, achievementImage: "person.fill", achievementTextToDisplay: "day streak")
                
                AchievementDetailView(achievemenTitle: "Break Champion", achievementDescription: "Earn 500$ from taking breaks", maxProgress: 500, currentProgress: Int(viewModel.lifetimeEarnings), color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "dollars")
                
                AchievementDetailView(achievemenTitle: "Break Marathon", achievementDescription: "Spend 24 hours on breaks", maxProgress: 1440, currentProgress: viewModel.timeSpentOnBreaksTotal, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "minutes")
                
                AchievementDetailView(achievemenTitle: "Break Professional", achievementDescription: "Take 100 breaks", maxProgress: 100, currentProgress: viewModel.breaksTakenTotal, color: .green, achievementImage: "person.fill", achievementTextToDisplay: "breaks")
                
                AchievementDetailView(achievemenTitle: "Super Chiller", achievementDescription: "Take 5 breaks in one day", maxProgress: 5, currentProgress: viewModel.breaksTakenToday, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks today")
                
                AchievementDetailView(achievemenTitle: "Break Tycoon", achievementDescription: "Earn $1000 from taking breaks", maxProgress: 1000, currentProgress: Int(viewModel.lifetimeEarnings), color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "dollars")
                
                // TODO: need to introduce a streak var to track this
                AchievementDetailView(achievemenTitle: "Chill Warrior", achievementDescription: "Take a break every day for 7 days", maxProgress: 7, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "day streak")
                
                AchievementDetailView(achievemenTitle: "Chill Millionaire", achievementDescription: "Earn $2000 from taking breaks", maxProgress: 2000, currentProgress: Int(viewModel.lifetimeEarnings), color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "dollars")
                
                AchievementDetailView(achievemenTitle: "Legendary Office Worker", achievementDescription: "Take 500 breaks", maxProgress: 500, currentProgress: viewModel.breaksTakenTotal, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks")
                
                // this might needs work
                AchievementDetailView(achievemenTitle: "Break Marathon", achievementDescription: "Spend 100 hours during breaks", maxProgress: 6000, currentProgress: viewModel.timeSpentOnBreaksTotal, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "minutes")
                
                AchievementDetailView(achievemenTitle: "Daily Chiller", achievementDescription: "Take 10 breaks in one day", maxProgress: 10, currentProgress: viewModel.breaksTakenToday, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks today")
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.darkBackground)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ChallengesView(viewModel: TimerModel())
}
