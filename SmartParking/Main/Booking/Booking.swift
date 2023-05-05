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
                VStack(spacing: 30){
                    HStack(spacing: 22){
                        Text("Customer Name")
                            .foregroundColor(Color("White"))
                            .frame(minWidth: 280, maxWidth: .infinity)
                        Text("Phone Number")
                            .foregroundColor(Color("White"))
                            .frame(minWidth: 160,  maxWidth: .infinity)
                        Text("Mark Number")
                            .foregroundColor(Color("White"))
                            .frame(minWidth: 130,  maxWidth: .infinity)
                        Text("Mark Car")
                            .foregroundColor(Color("White"))
                            .frame(minWidth: 160,  maxWidth: .infinity)
                        Text("Date in")
                            .foregroundColor(Color("White"))
                            .frame(minWidth: 160,  maxWidth: .infinity)
                        Text("Date out")
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
                
                VStack(spacing: 30){
                    ForEach(dictionary.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        
                        HStack(spacing: 22){
                            Text("\(value["name"] as? String ?? "")")
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 280, maxWidth: .infinity)
                            Text("+380-96-338-6743")
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 160,  maxWidth: .infinity)
                            Text("\(value["number"] as? String ?? "")")
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 130,  maxWidth: .infinity)
                            Text("\(value["model"] as? String ?? "")")
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 160,  maxWidth: .infinity)
                            Text((value["data_in"] as? String ?? "").prefix(19))
                                .foregroundColor(Color("White"))
                                .frame(minWidth: 160,  maxWidth: .infinity)
                            Text((value["data_out"] as? String ?? "").prefix(19))
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
                if let url = URL(string: "http://143.47.189.24:8000/data") {
                    URLSession.shared.dataTask(with: url) { data, response, error in
                        
                        if let error = error {
                            print("Error: \(error)")
                            return
                        }
        
                        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                            print("Invalid response")
                            return
                        }
        
                        if let data = data {
                            do {
                                let json = try JSONSerialization.jsonObject(with: data, options: [])
                                if let dictionary = json as? [String:[String: Any]] {
                                    self.dictionary = dictionary
                                    print(dictionary)
                                    if let thirdValue = dictionary.values.dropFirst(2).first, let name = thirdValue["status"] as? Int {
                                        print(name)
                                    }
                                }
                            } catch {
                                print("Error: \(error)")
                            }
                        }
                    }.resume()
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


