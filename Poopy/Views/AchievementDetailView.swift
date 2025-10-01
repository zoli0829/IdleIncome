//
//  AchievementDetailView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct AchievementDetailView: View {
    let achievemenTitle: String
    let achievementDescription: String
    let maxProgress: Int
    var currentProgress: Int
    let color: Color
    let achievementImage: String
    let achievementTextToDisplay: String
    
    var achievementProgress: Float {
        Float(currentProgress) / Float(maxProgress)
    }
    
    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: achievementImage)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(color)
                
            VStack {
                Text(achievemenTitle)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
                
                Text(achievementDescription)
                    .foregroundStyle(.gray)
                
                ProgressView(value: achievementProgress)
                    .sliderThumbVisibility(.hidden)
                    .tint(.green)
                
                Text("\(currentProgress)/\(maxProgress) \(achievementTextToDisplay)")
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
    AchievementDetailView(achievemenTitle: "Title", achievementDescription: "Description", maxProgress: 50, currentProgress: 1, color: .yellow, achievementImage: "person.fill", achievementTextToDisplay: "breaks taken")
}
