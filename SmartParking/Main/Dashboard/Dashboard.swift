//
//  Dashboard.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import Foundation
import SwiftUI



@available(macOS 12.0, *)
struct Dashboard: View {

        var body: some View {
            VStack(spacing: nil) {
                Spacer(minLength: nil)
                Scoreboard()
                Spacer(minLength: nil)
                HStack(spacing: 83){
                    
                    HStack(){
                        Rectangle()
                            .fill(Color("Red"))
                            .frame(width: 19, height: 19)
                        Text("Occupied")
                            .font(.custom("Rubik-Bold", size: 14))
                            .foregroundColor(Color("White"))
                    }
                    
                    HStack(){
                        Rectangle()
                            .fill(Color("White"))
                            .frame(width: 19, height: 19)
                        Text("Available")
                            .font(.custom("Rubik-Bold", size: 14))
                            .foregroundColor(Color("White"))
                    }
                    
                }.frame(minWidth: 425, minHeight: 50)
                   
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity").opacity(0.40),Color("SemiDarkBlue").opacity(0.36)]), startPoint: .bottom, endPoint: .top)
                    )
                    .cornerRadius(20)
                Spacer(minLength: nil)
                
                
                Parking()
                Spacer(minLength: nil)
                
            }
        }
    }
    

@available(macOS 12.0, *)
struct Dashboard_Previews: PreviewProvider {
        static var previews: some View {
            Dashboard()
        }
    }

