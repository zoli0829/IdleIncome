//
//  AchievementDetailView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct AchievementDetailView: View {
    @StateObject var viewModel: AchievementDetailViewModel
    
    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: viewModel.isAchievementUnlocked ? viewModel.achievement.unlockedImage : viewModel.achievement.lockedImage)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(viewModel.achievement.color)
                
            VStack {
                Text(viewModel.achievement.title)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
                
                Text(viewModel.achievement.description)
                    .foregroundStyle(.gray)
                
                ProgressView(value: viewModel.achievementProgress)
                    .sliderThumbVisibility(.hidden)
                    .tint(.green)
                
                Text("\(viewModel.currentProgress)/\(viewModel.achievement.maxProgress) \(viewModel.achievement.progressText)")
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

#Preview {
    AchievementDetailView(viewModel: AchievementDetailViewModel(achievement: Achievement(title: "Test Title", description: "Test Description", maxProgress: 500, color: .green, lockedImage: "person", unlockedImage: "person.fill", progressText: " dollars"), currentProgress: 1))
}
