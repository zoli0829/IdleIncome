//
//  HomeView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var viewModel: TimerViewModel = TimerViewModel()
    
    var body: some View {
        TabView {
            TimerView(viewModel: viewModel)
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
            
            ChallengesView(viewModel: viewModel)
                .tabItem {
                    Label("Challenges", systemImage: "trophy")
                }
            
            ProfileView(viewModel: viewModel)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .tint(.green)
        .onAppear() {
            viewModel.checkResets()
            viewModel.loadStreak()
        }
        .onChange(of: scenePhase) { newPhase in
                    switch newPhase {
                    case .background:
                        viewModel.appMovedToBackground()
                    case .active:
                        viewModel.appMovedToForeground()
                    default:
                        break
                    }
                }
    }
}

#Preview {
    HomeView()
}
