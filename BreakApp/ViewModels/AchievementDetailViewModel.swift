//
//  AchievementDetailViewModel.swift
//  Poopy
//
//  Created by Zoltan Vegh on 05/10/2025.
//

import Combine
import SwiftUI

@MainActor
final class AchievementDetailViewModel: ObservableObject {
    let achievement: Achievement
    @Published var currentProgress: Int
    
    var achievementProgress: Float {
        Float(currentProgress) / Float(achievement.maxProgress)
    }
    
    var isAchievementUnlocked: Bool {
        currentProgress >= achievement.maxProgress
    }
    
    init(achievement: Achievement, currentProgress: Int) {
        self.achievement = achievement
        self.currentProgress = currentProgress
    }
}
