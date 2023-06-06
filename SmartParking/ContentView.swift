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
        // Оператор switch відповідає за переходи між авторизацією та головною сторінкою системи
        switch Transfer {
            case false:
            
            Login(Transfer: $Transfer.animation()) // Дана функція відповідає за відображення сторінки авторизації та передає значення Transfer в дану функцію
                .frame(minWidth: 1240, maxWidth: .infinity, minHeight: 700, maxHeight: .infinity) // Відповідає за налаштування розмірів фрейму
                    .padding() // Робить відступи з усіх сторін на декілька пікселів
            case true:
            Main(Transfer: $Transfer.animation())  // Дана функція відповідає за відображення сторінки головної та передає значення Transfer в дану функцію
                .frame(minWidth: 1240, maxWidth: .infinity, minHeight: 700, maxHeight: .infinity) // Відповідає за налаштування розмірів фрейму
        }
    }
}

@available(macOS 12.0, *)
struct ContentView_Previews: PreviewProvider { // Дана модель відповідає за предпоказ фрейму у вигляді моделі у вікні Сanvas в Xcode
    static var previews: some View {
        ContentView()
    }
}
