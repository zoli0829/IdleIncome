//
//  TimerView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("Current Break")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.aquamarine)
                    .padding(.bottom, 5)
                
                Text(viewModel.formattedTime)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.aquamarine)
                    .padding(.bottom, 5)
                
                Text(viewModel.earnedSalary, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.brightTeal)
                    .padding(.bottom, 10)
                
                Button {
                    if viewModel.isRunning {
                        viewModel.stopTimer()
                        viewModel.finishBreak()
                    } else {
                        viewModel.startTimer()
                    }
                } label: {
                    Text(viewModel.isRunning ? "Stop" : "Start Chilling")
                        .font(.system(size: 20))
                        .bold()
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.black)
                        .background(.brightTeal)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .padding(.horizontal)
                }
            }
            .frame(height: 250)
            .frame(maxWidth: .infinity)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                VStack {
                    Text("Today")
                        .foregroundStyle(.aquamarine)
                    
                    Text(viewModel.earnedToday, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .foregroundStyle(.brightTeal)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 75)
                .background(.containerGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    Text("This Week")
                        .foregroundStyle(.aquamarine)
                    
                    Text(viewModel.earnedThisWeek, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .foregroundStyle(.brightTeal)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 75)
                .background(.containerGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    Text("This Month")
                        .foregroundStyle(.aquamarine)
                    
                    Text(viewModel.earnedThisMonth, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                        .foregroundStyle(.brightTeal)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 75)
                .background(.containerGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(height: 150)
            .frame(maxWidth: .infinity)
            
            VStack() {
                HStack {
                    Image(systemName: "line.diagonal.arrow")
                        .foregroundStyle(.brightTeal)
                    
                    Text("Lifetime Earnings")
                        .font(.system(size: 24))
                        .foregroundStyle(.aquamarine)
                }
                
                Text(viewModel.lifetimeEarnings, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.brightTeal)
            }
            .padding()
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .padding()
        .background(.darkBackground)
    }
}

#Preview {
    TimerView(viewModel: TimerViewModel())
}
