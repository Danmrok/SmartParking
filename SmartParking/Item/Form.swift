//
//  Form.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import Foundation
import SwiftUI

struct Form: View {
    
    @State private var PhoneNumber : String = ""
    @State private var Password : String = ""
    @Binding public var Transfer: Bool
    
    var body: some View {
        
        VStack(spacing: 53) {
            
            TextField("+380-(66)-333-8711", text: $PhoneNumber)
                
                .padding(.horizontal, 20)
                .textFieldStyle(.plain)
                .frame(minWidth: 450, maxWidth: 600)
                .frame(height: 100)
                .background(Color("White"))
                .foregroundColor(Color("Black"))
                .cornerRadius(20)
                .font(.custom("Rubik-Regular", size: 24))
                .cornerRadius(10)
            
            SecureField("Password", text: $Password)
            
                .padding(.horizontal, 20)
                .foregroundColor(Color("Black"))
                .frame(minWidth: 450, maxWidth: 600)
                .frame(height: 100)
                .textFieldStyle(.plain)
                .background(Color("White"))
                .cornerRadius(20)
                .font(.custom("Rubik-Regular", size: 24))
                
                
            Button{
                self.Transfer = !Transfer
            } label: {
                
                Text("Log in")
                
                    
            }.buttonStyle(.plain)
                .frame(minWidth: 450, maxWidth: 600)
                .frame(height: 100)
                .background(Color("BlueOpacity"))
                .foregroundColor(Color("Green"))
                .cornerRadius(20)
                .font(.custom("Rubik-Bold", size: 24))
                
                
        }
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form(Transfer: .constant(false))
    }
}
