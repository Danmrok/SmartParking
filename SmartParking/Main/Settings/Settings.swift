//
//  Settings.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import Foundation
import SwiftUI


@available(macOS 12.0, *)
struct Settings: View {
    
    @State private var language: Bool = true
    @State private var language1: Bool = false
    @State private var language2: Bool = false
    
    
    var body: some View {
        VStack(spacing: 170){
            HStack(spacing: 150){
                Text("Language")
                    .foregroundColor(Color("White"))
                    .font(.custom("Rubik-Medium", size: 36))
                
                VStack(spacing: 40){
                    Button(action: {
                        self.language = true
                        self.language1 = false
                        self.language2 = false
                    }, label: {
                        HStack{
                            Text("English")
                                .foregroundColor(Color("White"))
                                .font(.custom("Rubik-Medium", size: 24))
                                .padding(.leading, 20)
                            Spacer()
                            Image(language == true ? "Check" : "")
                                .foregroundColor(Color("White"))
                                .padding(.trailing, 20)
                            
                        }.frame(width: 380, height: 80)
                            .background(
                            LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity"), Color("SemiDarkBlue")]), startPoint: .bottom, endPoint: .top)
                        )
                            .cornerRadius(10)
                        
                    }).buttonStyle(.plain)
                    
                    Button(action: {
                        self.language = false
                        self.language1 = true
                        self.language2 = false
                    }, label: {
                        HStack{
                            Text("Ukraine")
                                .foregroundColor(Color("White"))
                                .font(.custom("Rubik-Medium", size: 24))
                                .padding(.leading, 20)
                            Spacer()
                            Image(language1 == true ? "Check" : "")
                                .foregroundColor(Color("White"))
                                .padding(.trailing, 20)
                            
                        }.frame(width: 380, height: 80)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity"), Color("SemiDarkBlue")]), startPoint: .bottom, endPoint: .top)
                            )
                            .cornerRadius(10)
                        
                    }).buttonStyle(.plain)
                    
                    Button(action: {
                        self.language = false
                        self.language1 = false
                        self.language2 = true
                    }, label: {
                        HStack{
                            Text("Polish")
                                .foregroundColor(Color("White"))
                                .font(.custom("Rubik-Medium", size: 24))
                                .padding(.leading, 20)
                            Spacer()
                            Image(language2  == true ? "Check" : "")
                                .foregroundColor(Color("White"))
                                .padding(.trailing, 20)
                            
                        }.frame(width: 380, height: 80)
                            .background(
                            LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity"), Color("SemiDarkBlue")]), startPoint: .bottom, endPoint: .top)
                        )
                            .cornerRadius(10)
                    }).buttonStyle(.plain)
                    
                }
                
            }
            HStack(spacing: 180){
                Text("Support")
                    .foregroundColor(Color("White"))
                    .font(.custom("Rubik-Medium", size: 36))
                Button(action: {
                    
                }, label: {
                    HStack{
                        
                        Text("Telegram")
                            .foregroundColor(Color("White"))
                            .font(.custom("Rubik-Medium", size: 24))
                            .padding(.leading, 20)
                        Spacer()
                        Image("Telegram")
                            .foregroundColor(Color("White"))
                            .padding(.trailing, 20)
                       
                    }.frame(width: 380, height: 80)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity"), Color("SemiDarkBlue")]), startPoint: .bottom, endPoint: .top)
                        )
                        .cornerRadius(10)
                    
                }).buttonStyle(.plain)
                
            }
        }.frame(maxWidth: .infinity)
    }
}


@available(macOS 12.0, *)
struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
