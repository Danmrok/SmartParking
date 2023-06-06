//
//  Scoreboard.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//


import SwiftUI

struct Scoreboard: View {
    
    @EnvironmentObject var dataModel: ViewModel // Отримання даних з об'єкта не маючи доступу надати зміни в даний об'єкт
    
    @State var total = 20 // Статична змінна

    
    var body: some View {
        
       let SumOccupied = dataModel.dictionary.values.reduce(0) { $0 + ($1["status"] as? Int == 0 ? 0 : 1) } // Дана змінна підраховує кількість зайнятих місць
       let SumAvailable = total - dataModel.dictionary.values.reduce(0) { $0 + ($1["status"] as? Int == 0 ? 0 : 1) }  // Дана змінна підраховує кількість вільних місць
        
        HStack(spacing: 20){
            VStack(spacing: 20) {
                Text("\(total)")
                    .font(.custom("Rubik-Bold", size: 40)) // Надає можливість змінити шрифт на інший
                    .foregroundColor(Color("White")) // Змінює колір тексту
                Text("Total")
                    .font(.custom("Rubik-Bold", size: 40)) // Надає можливість змінити шрифт на інший
                    .foregroundColor(Color("White")) // Змінює колір тексту
            }.frame(maxWidth: 380, maxHeight: 200)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("BlueOpacity"), Color("SemiDarkBlue")]), startPoint: .bottom, endPoint: .top)
                ) // Надає можливість зробити лінійний градієнт
                .cornerRadius(8) // Робить заокруглення фрейму
                
            
            VStack(spacing: 20) {
        
                Text("\(SumOccupied)")
                        .foregroundColor(Color("White")) // Змінює колір тексту
                        .font(.custom("Rubik-Bold", size: 40)) // Надає можливість змінити шрифт на інший
               
                Text("Occupied")
                    .font(.custom("Rubik-Bold", size: 40)) // Змінює колір тексту
                    .foregroundColor(Color("Red")) // Надає можливість змінити шрифт на інший
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
            
            dataModel.fetchData() // Дана команда викликає запит на отримання інформації з серверу

        }
        .padding(.horizontal, 20) // Відступ по горизонталі з 2 сторін на 20 пікселів
    }
}

struct Scoreboard_Previews: PreviewProvider {
    static var previews: some View {
        Scoreboard()
    }
}
