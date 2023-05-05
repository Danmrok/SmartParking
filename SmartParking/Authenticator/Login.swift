//
//  Login.swift
//  SmartParking
//
//  Created by Denys Striltsov on 05.02.2023.
//

import Foundation
import SwiftUI

@available(macOS 12.0, *)
struct Login: View {
    
    @Binding public var Transfer: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            VStack {
                Logo()
            }.frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
                VStack(alignment: .center, spacing: 53){
                    
                    Text("Log in")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.custom("Rubik-Regular", size: 48))
                        .foregroundColor(Color("Green"))
                    
                    Form(Transfer: $Transfer)

                }
            Spacer(minLength: 60)
        } 
            .padding()
        
        
    }
}

@available(macOS 12.0, *)
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
