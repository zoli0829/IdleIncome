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
            Text("Challenges")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.darkBackground)
    }
}

#Preview {
    ChallengesView()
}
