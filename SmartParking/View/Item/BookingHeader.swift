//
//  BookingHeader.swift
//  SmartParking
//
//  Created by Denys Striltsov on 05.05.2023.
//

import SwiftUI

struct BookingHeader: View {
    var body: some View {
        VStack(spacing: 30){
            HStack(spacing: 22){
                Text("Customer Name")
                    .font(.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color("White"))
                    .frame(minWidth: 280, maxWidth: .infinity)
                Text("Phone Number")
                    .font(.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color("White"))
                    .frame(minWidth: 160,  maxWidth: .infinity)
                Text("Mark Number")
                    .font(.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color("White"))
                    .frame(minWidth: 130,  maxWidth: .infinity)
                Text("Mark Car")
                    .font(.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color("White"))
                    .frame(minWidth: 160,  maxWidth: .infinity)
                Text("Date in")
                    .font(.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color("White"))
                    .frame(minWidth: 160,  maxWidth: .infinity)
                Text("Date out")
                    .font(.custom("Rubik-Medium", size: 14))
                    .foregroundColor(Color("White"))
                    .frame(minWidth: 180,  maxWidth: .infinity)
            }
            Image("Line4")
                .resizable()
                .frame(minWidth: 1160, maxWidth: .infinity)
                .padding(.trailing, 20)
                .foregroundColor(Color("White"))
                .frame(minWidth: 180, maxWidth: .infinity)
            
        }.padding(.top, 20)
            .padding(.leading, 20)
    }
}

struct BookingHeader_Previews: PreviewProvider {
    static var previews: some View {
        BookingHeader()
    }
}
