//
//  ProfileView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.darkBackground)
    }
}

#Preview {
    ProfileView()
}
