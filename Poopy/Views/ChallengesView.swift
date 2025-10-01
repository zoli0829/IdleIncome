//
//  ChallengesView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct ChallengesView: View {
    var body: some View {
        VStack {
            ScrollView{
                AchievementDetailView(achievemenTitle: "Coffee Master", achievementDescription: "Took 50 breaks", maxProgress: 50, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks")
                
                AchievementDetailView(achievemenTitle: "Coffee Lord", achievementDescription: "Spend 10 hours not working", maxProgress: 600, currentProgress: 0, color: .green, achievementImage: "person.fill", achievementTextToDisplay: "minutes")
                
                AchievementDetailView(achievemenTitle: "Coffee Fund", achievementDescription: "Earn 100$ from coffee breaks", maxProgress: 100, currentProgress: 0, color: .green, achievementImage: "person.fill", achievementTextToDisplay: "dollars")
                
                AchievementDetailView(achievemenTitle: "Triple Threat", achievementDescription: "Take 3 breaks in one day", maxProgress: 3, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks today")
                
                AchievementDetailView(achievemenTitle: "Regular Royal", achievementDescription: "Take a break 5 days in a row", maxProgress: 5, currentProgress: 0, color: .green, achievementImage: "person.fill", achievementTextToDisplay: "5 day streak")
                
                AchievementDetailView(achievemenTitle: "Coffee Champion", achievementDescription: "Earn 500$ from coffee breaks", maxProgress: 500, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "dollars")
                
                AchievementDetailView(achievemenTitle: "Break Marathon", achievementDescription: "Spend 24 hours on breaks", maxProgress: 1440, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "minutes")
                
                AchievementDetailView(achievemenTitle: "Break Professional", achievementDescription: "Take 100 coffee breaks", maxProgress: 100, currentProgress: 0, color: .green, achievementImage: "person.fill", achievementTextToDisplay: "breaks")
                
                AchievementDetailView(achievemenTitle: "Super Drinker", achievementDescription: "Take 5 coffee breaks in one day", maxProgress: 5, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks today")
                
                AchievementDetailView(achievemenTitle: "Break Tycoon", achievementDescription: "Earn $1000 from coffee breaks", maxProgress: 1000, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "dollars")
                
                AchievementDetailView(achievemenTitle: "Coffee Warrior", achievementDescription: "Take a coffee break every day for 7 days", maxProgress: 7, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "day streak")
                
                AchievementDetailView(achievemenTitle: "Coffee Millionaire", achievementDescription: "Earn $2000 from coffee breaks", maxProgress: 2000, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "dollars")
                
                AchievementDetailView(achievemenTitle: "Legendary Coffee Drinker", achievementDescription: "Take 500 coffee breaks", maxProgress: 500, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks")
                
                AchievementDetailView(achievemenTitle: "Coffee Marathon", achievementDescription: "Spend 100 hours drinking coffee", maxProgress: 6000, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "minutes")
                
                AchievementDetailView(achievemenTitle: "Daily Drinker", achievementDescription: "Take 10 coffee breaks in one day", maxProgress: 10, currentProgress: 0, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks today")
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.darkBackground)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ChallengesView()
}
