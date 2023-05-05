//
//  Scoreboard.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import Foundation
import SwiftUI

struct Scoreboard: View {
    
    @State var dictionary: [String: [String: Any]] = [:]
    @State var total = 20
    @State var SumOccupied = 0
    @State var SumAvailable = 0

    var body: some View {
    
        HStack(spacing: 20){
            VStack(spacing: 20) {
                Text("\(total)")
                    .font(.custom("Rubik-Bold", size: 40))
                    .foregroundColor(Color("White"))
                Text("Total")
                    .font(.custom("Rubik-Bold", size: 40))
                    .foregroundColor(Color("White"))
            }.frame(maxWidth: 380, maxHeight: 200)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity"), Color("SemiDarkBlue")]), startPoint: .bottom, endPoint: .top)
                )
                .cornerRadius(8)
                
            
            VStack(spacing: 20) {
        
                    Text("\(SumOccupied)")
                        .foregroundColor(Color("White"))
                        .font(.custom("Rubik-Bold", size: 40))
                
               
                Text("Occupied")
                    .font(.custom("Rubik-Bold", size: 40))
                    .foregroundColor(Color("Red"))
            }.frame(maxWidth: 380, maxHeight: 200)
                
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity"), Color("SemiDarkBlue")]), startPoint: .bottom, endPoint: .top)
                )
                .cornerRadius(8)
            VStack(spacing: 20){
                Text("\(SumAvailable)")
                    .font(.custom("Rubik-Bold", size: 40))
                    .foregroundColor(Color("White"))
                Text("Available")
                    .font(.custom("Rubik-Bold", size: 40))
                    .foregroundColor(Color("Green"))
            }.frame(maxWidth: 380, maxHeight: 200)
               
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity"), Color("SemiDarkBlue")]), startPoint: .bottom, endPoint: .top)
                )
                .cornerRadius(8)
            
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
                                let countOccupied = dictionary.values.reduce(0) { $0 + ($1["status"] as? Int == 0 ? 1 : 0) }
                                let countAvailable = dictionary.values.reduce(0) { $0 + ($1["status"] as? Int == 0 ? 1 : 0) }
                                self.SumOccupied = countOccupied
                                self.SumAvailable = total - countAvailable
//                                let totalStatus = dictionary.values.reduce(0) { sum, value in
//                                    let status = value["status"] as? Int ?? 0
//                                    return sum + status
//                                }
                            }
                        } catch {
                            print("Error: \(error)")
                        }
                    }
                }.resume()
            }
        }
        .padding(.horizontal, 20)
    }
}

struct Scoreboard_Previews: PreviewProvider {
    static var previews: some View {
        Scoreboard()
    }
}
