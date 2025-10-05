//
//  AchievementDetailView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct AchievementDetailView: View {
    let achievement: Achievement
    @Binding var currentProgress: Int
    
    var achievementProgress: Float {
        Float(currentProgress) / Float(achievement.maxProgress)
    }
    
    var isAchievementUnlocked: Bool {
        currentProgress >= achievement.maxProgress
    }
    
    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: isAchievementUnlocked ? achievement.unlockedImage : achievement.lockedImage)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(achievement.color)
                
            VStack {
                Text(achievement.title)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
                
                Text(achievement.description)
                    .foregroundStyle(.gray)
                
                ProgressView(value: achievementProgress)
                    .sliderThumbVisibility(.hidden)
                    .tint(.green)
                
                Text("\(currentProgress)/\(achievement.maxProgress) \(achievement.progressText)")
                    .foregroundStyle(.gray)
                
            }
        }
        .padding()
        .background(.containerGrey)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// TODO: Need to figure out a way to make the preview work
//#Preview {
//    AchievementDetailView(achievement: Achievement(title: "Title", description: "Desc", maxProgress: 500, color: .green, lockedImage: "person", unlockedImage: "person.fill", progressText: "breaks taken"), currentProgress: )
//}
