//
//  SmartParkingApp.swift
//  SmartParking
//
//  Created by Denys Striltsov on 24.01.2023.
//

import SwiftUI // Імопрт фреймворку на мові swift

@main // Він містить точку входу для програми та має надавати статичну основну функцію.
@available(macOS 12.0, *) // Даний метод віповідає за пітримку версій операційної системи від 12 версії
struct SmartParkingApp: App {
    
    @StateObject var dataModel = ViewModel() // Дана змінна необхідна щоб динамічно оновлювати дані при зміні даних в сервері
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, .light) // Зміна системної теми на світлий
                .background(Color("SemiDarkBlue")) // Зміна кольору фона програми
                .environmentObject(dataModel) // Динамічне оновлення
        }
    }
}
