//
//  Parking.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import Foundation
import SwiftUI


@available(macOS 12.0, *)
struct Parking: View {
    
    @State var dictionary: [String: [String: Any]] = [:]
    var Saver = ["A01", "A02", "A03", "A04", "A05", "A06",
                 "A07", "A08", "A09", "A10", "A11", "A12",
                 "A13", "A14", "A15", "A16", "A17", "A18",
                 "A19", "A20"
    ]
    
    
    var body: some View {
        HStack(spacing: 250) {
          
            VStack(spacing: 0){
                
                HStack(spacing: 45){
                    ForEach(Saver.prefix(5), id: \.self){kite in
                        Text(kite)
                            .font(.custom("Rubik-Bold", size: 18))
                            .foregroundColor(Color("White"))
                    }
                }
                .padding(.bottom, 10)
                
                HStack(spacing: 10){
                    Image("Line3")
                        .resizable()
                        .frame(width: 1, height: 120)
                        .background(Color.white)
                    ForEach(dictionary.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                        Image(value["status"] as? Int == 0 ? "WhiteCar" : "RedCar")
                            .resizable()
                            .frame(width: 58, height: 115)
                            .rotationEffect(Angle(degrees: 180))
                            .padding(.bottom, 10)
                        Image("Line3")
                            .resizable()
                            .frame(width: 1, height: 120)
                            .background(Color.white)
                       
                    }
                    ForEach(0..<3, id: \.self){_ in
                        Image("WhiteCar")
                            .resizable()
                            .frame(width: 58, height: 115)
                            .rotationEffect(Angle(degrees: 180))
                            .padding(.bottom, 10)
                        Image("Line3")
                            .resizable()
                            .frame(width: 1, height: 120)
                            .background(Color.white)
                    }
                }
                
                VStack {
                    Image("Line1")
                        .resizable()
                        .frame(width: 395, height: 1)
                        .background(Color.white)


                }
                HStack(spacing: 10){
                    Image("Line3")
                        .resizable()
                        .frame(width: 1, height: 120)
                        .background(Color.white)
                    
                    ForEach(0..<5, id: \.self){_ in
                        Image("WhiteCar")
                            .resizable()
                            .frame(width: 58, height: 115)
                            .padding(.top, 10)
                           
                        Image("Line3")
                            .resizable()
                            .frame(width: 1, height: 120)
                            .background(Color.white)
                    }
                }
             
                HStack(spacing: 45){
                    ForEach(Saver.prefix(10).suffix(5), id: \.self){kite in
                        Text(kite)
                            .font(.custom("Rubik-Bold", size: 18))
                            .foregroundColor(Color("White"))
                    }
                }
                .padding(.top, 10)
            }
          
            VStack(spacing: 0){
                HStack(spacing: 45){
                    ForEach(Saver.prefix(15).suffix(5), id: \.self){kite in
                        Text(kite)
                            .font(.custom("Rubik-Bold", size: 18))
                            .foregroundColor(Color("White"))
                    }
                }
                .padding(.bottom, 10)
                
                HStack(spacing: 10){
                    Image("Line3")
                        .resizable()
                        .frame(width: 1, height: 120)
                        .background(Color.white)
                    ForEach(0..<5, id: \.self){_ in
                        Image("WhiteCar")
                            .resizable()
                            .frame(width: 58, height: 115)
                            .rotationEffect(Angle(degrees: 180))
                            .padding(.bottom, 10)
                        Image("Line3")
                            .resizable()
                            .frame(width: 1, height: 120)
                            .background(Color.white)
                    }
                }
                  
                
                VStack {
                    Image("Line1")
                        .resizable()
                        .frame(width: 395, height: 1)
                        .background(Color.white)
                }

                HStack(spacing: 10){
                    Image("Line3")
                        .resizable()
                        .frame(width: 1, height: 120)
                        .background(Color.white)
                    ForEach(0..<5, id: \.self){_ in
                        Image("WhiteCar")
                            .resizable()
                            .frame(width: 58, height: 115)
                            .padding(.top, 10)
                        Image("Line3")
                            .resizable()
                            .frame(width: 1, height: 120)
                            .background(Color.white)
                       
                    }
                }
             
                HStack(spacing: 45){
                    ForEach(Saver.suffix(5), id: \.self){kite in
                        Text(kite)
                            .font(.custom("Rubik-Bold", size: 18))
                            .foregroundColor(Color("White"))
                    }
                }
                .padding(.top, 10)
            }
            
        }
        .onAppear{
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
        .frame(minWidth: 824,maxWidth: .infinity, minHeight: 330)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity").opacity(0.35), Color("SemiDarkBlue")]), startPoint: .center, endPoint: .top)
            )
        .cornerRadius(20)
            .padding(.horizontal, 20)
    }
}


@available(macOS 12.0, *)
struct Parking_Previews: PreviewProvider {
    static var previews: some View {
        Parking()
    }
}
