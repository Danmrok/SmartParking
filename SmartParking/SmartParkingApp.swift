//
//  SmartParkingApp.swift
//  SmartParking
//
//  Created by Denys Striltsov on 24.01.2023.
//

import SwiftUI

@main
@available(macOS 12.0, *)
struct SmartParkingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, .light)
                .background(Color("SemiDarkBlue"))
        }
    }
}
