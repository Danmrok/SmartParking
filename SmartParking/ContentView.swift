//
//  ContentView.swift
//  SmartParking
//
//  Created by Denys Striltsov on 24.01.2023.
//

import SwiftUI

@available(macOS 12.0, *)
struct ContentView: View {
    
    @State private var Transfer: Bool = false
    
    var body: some View {
        
        switch Transfer {
            case false:
            Login(Transfer: $Transfer.animation())
                .frame(minWidth: 1240, maxWidth: .infinity, minHeight: 700, maxHeight: .infinity)
                    .padding()
            case true:
            Main(Transfer: $Transfer.animation())
                .frame(minWidth: 1240, maxWidth: .infinity, minHeight: 700, maxHeight: .infinity)
        }
    }
}

@available(macOS 12.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
