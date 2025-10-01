//
//  TimerView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Current Poop Break")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                
                Text("0:00")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                
                Text("$0.00")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.green)
                    .padding(.bottom, 10)
                
                Button {
                    
                } label: {
                    Text("Start Pooping")
                        .frame(width: 300, height: 50)
                        .foregroundStyle(.black)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                }
            }
            .frame(width: 370, height: 250)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                VStack {
                    Text("Today")
                        .foregroundStyle(.gray)
                    
                    Text("$0.00")
                        .foregroundStyle(.green)
                }
                .frame(width: 120, height: 75)
                .background(.containerGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    
                    Text("This Week")
                        .foregroundStyle(.gray)
                    
                    Text("$0.00")
                        .foregroundStyle(.green)
                }
                .frame(width: 120, height: 75)
                .background(.containerGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack {
                    Text("This Month")
                        .foregroundStyle(.gray)
                    
                    Text("$0.00")
                        .foregroundStyle(.green)
                }
                .frame(width: 120, height: 75)
                .background(.containerGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(width: 350)
            .frame(height: 150)
            
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
            .frame(width: 350)
            .padding()
            .frame(height: 100)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Spacer()
        }
        .frame(width: .infinity)
        .padding()
        .background(.darkBackground)
    }
}

#Preview {
    TimerView()
}
