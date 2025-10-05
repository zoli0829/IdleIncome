//
//  ProfileView.swift
//  Poopy
//
//  Created by Zoltan Vegh on 01/10/2025.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: TimerViewModel
    @FocusState private var isEditingRate: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("Hourly Rate")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                
                TextField("Hourly Rate", value: $viewModel.hourlyRate, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.green)
                    .padding(.horizontal)
                    .focused($isEditingRate)
                
                Button {
                    if !isEditingRate {
                        isEditingRate = true
                    } else {
                        isEditingRate = false
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: "pencil")
                        
                        Text(isEditingRate == false ? "Edit Rate" : "Save Rate")
                        
                    }
                    .font(.system(size: 20))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .frame(width: 150, height: 50)
                    .foregroundStyle(.black)
                    .background(.green)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                }
                .buttonStyle(.plain)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .frame(height: 200)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack {
                Text("All Time Stats")
                    .font(.system(size: 24))
                    .foregroundStyle(.white)
                
                HStack {
                    VStack {
                        Text("Total Earnings")
                            .foregroundStyle(.gray)
                        
                        Text(viewModel.lifetimeEarnings, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                            .foregroundStyle(.green)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Total Time")
                            .foregroundStyle(.gray)
                        
                        Text(viewModel.formattedTotalTime)
                            .foregroundStyle(.green)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .frame(height: 120)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button {
                viewModel.eraseAllData()
            } label: {
                HStack {
                    Image(systemName: "eraser")
                    Text("Reset All Data")
                }
                .font(.system(size: 20))
                .bold()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.red)
                .background(.containerGrey)
                //.border(.red, width: 1) // stupid border gets fucky wucky by the rounded edges
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .padding()
            }
            
            Spacer()
        }
        //.frame(maxWidth: .infinity)
        //.frame(maxHeight: .infinity)
        .padding()
        .background(.darkBackground)
    }
}

#Preview {
    ProfileView(viewModel: TimerViewModel())
}
