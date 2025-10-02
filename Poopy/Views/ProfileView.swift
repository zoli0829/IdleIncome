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
            VStack {
                Text("Hourly Rate")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom, 5)
                
                Text("$25.00")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.green)
                
                Button {
                    
                } label: {
                    HStack {
                        Image(systemName: "pencil")
                        
                        Text("Edit Rate")
                        
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
                        
                        Text("$0.00")
                            .foregroundStyle(.green)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Total Time")
                            .foregroundStyle(.gray)

                        Text("0h 0m")
                            .foregroundStyle(.green)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            //.frame(width: 350)
            .padding()
            .frame(height: 120)
            .background(.containerGrey)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Button {
                
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
                //.border(.red, width: 1) // stupid border gets fucky fucky by the rounded edges
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .padding()
            }
            
            Spacer()
        }
        .frame(width: .infinity)
        .frame(maxHeight: .infinity)
        .padding()
        .background(.darkBackground)
    }
}

#Preview {
    ProfileView()
}
