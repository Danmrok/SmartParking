//
//  Booking.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import Foundation
import SwiftUI



    


@available(macOS 12.0, *)
struct Booking: View {
    
    
    @State var data: String = ""
    @State var dictionary: [String: [String: Any]] = [:]
    
    
    var body: some View {
        HStack(spacing: 0){
            ScrollView(.vertical){
                
                BookingHeader()
                
                VStack(spacing: 30){
                    ForEach(dictionary.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        
                        HStack(spacing: 22){
                            Text("\(value["name"] as? String ?? "")")
                                .font(.custom("Rubik-Medium", size: 14))
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 280, maxWidth: .infinity)
                            // owner_number
                            Text("\(value["owner_number"] as? String ?? "")")
                                .font(.custom("Rubik-Medium", size: 14))
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 160,  maxWidth: .infinity)
                            Text("\(value["number"] as? String ?? "")")
                                .font(.custom("Rubik-Medium", size: 14))
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 130,  maxWidth: .infinity)
                            Text("\(value["model"] as? String ?? "")")
                                .font(.custom("Rubik-Medium", size: 14))
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 160,  maxWidth: .infinity)
                            Text((value["data_in"] as? String ?? "").prefix(19))
                                .font(.custom("Rubik-Medium", size: 14))
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 160,  maxWidth: .infinity)
                            Text((value["data_out"] as? String ?? "").prefix(19))
                                .font(.custom("Rubik-Medium", size: 14))
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 180,  maxWidth: .infinity)
                            
                        }
                        Image("Line4")
                            .resizable()
                            .frame(minWidth: 1160, maxWidth: .infinity)
                            .padding(.trailing, 20)
                            .foregroundColor(Color("White"))
                             
                    }
                     
            }.onAppear{
                fetchDataFromURL{dictionary, error in
                    if let dictionary = dictionary {
                        self.dictionary = dictionary
                    } else {
                        print("Error: \(String(describing: error))")
                    }
                }
            }
                
            .padding(.top, 20)
            .padding(.leading, 20)
                
                
        }.frame(maxWidth: .infinity)
    }
}
    
    
    
    
    
    
@available(macOS 12.0, *)
struct Booking_Previews: PreviewProvider {
        static var previews: some View {
            Booking()
        }
    }
}


