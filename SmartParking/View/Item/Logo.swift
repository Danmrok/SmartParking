//
//  Logo.swift
//  SmartParking
//
//  Created by Denys Striltsov on 05.02.2023.
//

import Foundation
import SwiftUI


struct Logo: View {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image("Parking")
                    .imageScale(.large)
                .foregroundColor(.accentColor)
                Text("SmartParking")
                    .font(.custom("Rubik-Bold", size: 48))
                    .foregroundColor(Color("Green"))
            }
           
        }
    }
}
