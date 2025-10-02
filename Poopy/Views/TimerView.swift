//
//  TimerView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct TimerView: View {
    @StateObject private var viewModel: TimerModel = TimerModel()
    
    var body: some View {
        VStack {
            VStack {
                Text("Current Break")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                
                Text(viewModel.formattedTime)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                
                Text("$0.00")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.green)
                    .padding(.bottom, 10)
                
                Button {
                    if viewModel.isRunning {
                        viewModel.stopTimer()
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
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
            }
            .frame(height: 250)
            .frame(maxWidth: .infinity)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                VStack {
                    Text("Today")
                        .foregroundStyle(.gray)
                    
                    Text("$0.00")
                        .foregroundStyle(.green)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 75)
                .background(.containerGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    
                    Text("This Week")
                        .foregroundStyle(.gray)
                    
                    Text("$0.00")
                        .foregroundStyle(.green)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 75)
                .background(.containerGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    Text("This Month")
                        .foregroundStyle(.gray)
                    
                    Text("$0.00")
                        .foregroundStyle(.green)
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
                        .foregroundStyle(.green)
                    
                    Text("Lifetime Earnings")
                        .font(.system(size: 24))
                        .foregroundStyle(.white)
                }
                
                Text("$0.00")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.green)
            }
            .padding()
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .padding()
        .frame(width: .infinity)
        .background(.darkBackground)
    }
}

#Preview {
    TimerView()
}
