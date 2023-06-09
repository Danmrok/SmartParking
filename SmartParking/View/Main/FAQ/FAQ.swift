//
//  FAQ.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//


import SwiftUI


@available(macOS 12.0, *)
struct FAQ: View {
    
    @State private var isExpanded = false
    @State private var isExpanded1 = false
    @State private var isExpanded2 = false
    @State private var isExpanded3 = false
    
    
    
    
    
    var body: some View {
        
        VStack(){
            HStack(alignment: .top, spacing: 50){
                VStack(spacing: 27){
                    VStack(spacing: 27){
                        Image("Line4")
                            .resizable()
                            .frame(width: 470, height: 5)
                            .foregroundColor(Color("White"))
                        CustomDisclosureGroup(animation: .easeInOut(duration: 0.2), isExpanded: $isExpanded) {
                            isExpanded.toggle()
                            self.isExpanded1 = false
                            self.isExpanded2 = false
                            self.isExpanded3 = false
                            
                            
                        } prompt: {
                            HStack(spacing: 0) {
                                
                                Text("Що на головній?")
                                    .font(.custom("Rubik-Medium", size: 36))
                                    .foregroundColor(Color("White"))
                                Spacer()
                                Image("Plus")
                                    .rotationEffect(isExpanded ? Angle(degrees: 45) : .zero)
                                    .foregroundColor(Color("White"))
                            }.frame(width: 470)
                        } expandedView: {
                            
                            Text("На даній сторінці знаходиться інформація про вільні та зайняті місця парковки. Червоними позначено зайняті місця, а білими - вільні.")
                                .font(.custom("Rubik-Medium", size: 18))
                                .frame(width: 470)
                                .foregroundColor(Color("White"))
                                .padding(.top, 50)
                            
                        }
                        Image("Line4")
                            .resizable()
                            .frame(width: 470, height: 5)
                            .foregroundColor(Color("White"))
                    }
                    
                    VStack(spacing: 27){
                        CustomDisclosureGroup(animation: .easeInOut(duration: 0.2), isExpanded: $isExpanded1) {
                            isExpanded1.toggle()
                            self.isExpanded = false
                            self.isExpanded2 = false
                            self.isExpanded3 = false
                            
                            
                            
                            
                            
                        } prompt: {
                            HStack(spacing: 0) {
                                Text("Призначення журналу")
                                    .font(.custom("Rubik-Medium", size: 36))
                                    .foregroundColor(Color("White"))
                                Spacer()
                                Image("Plus")
                                    .rotationEffect(isExpanded1 ? Angle(degrees: 45) : .zero)
                                    .foregroundColor(Color("White"))
                            }.frame(width: 470)
                        } expandedView: {
                            
                            Text("Призначення сторінки Журнал полягає в збереженні та організації інформації про в'їзд та виїзд автомобілів на територію, що включає в себе ПІБ водіїв, номери телефонів та автомобілів, а також дати їх в'їзду та виїзду.")
                                .font(.custom("Rubik-Medium", size: 18))
                                .frame(width: 470)
                                .foregroundColor(Color("White"))
                                .padding(.top, 50)
                            
                        }
                        Image("Line4")
                            .resizable()
                            .frame(width: 470, height: 5)
                            .foregroundColor(Color("White"))
                    }
                    
                    
                }
                
                VStack(spacing: 27){
                    VStack(spacing: 27){
                        Image("Line4")
                            .resizable()
                            .frame(width: 470, height: 5)
                            .foregroundColor(Color("White"))
                        CustomDisclosureGroup(animation: .easeInOut(duration: 0.2), isExpanded: $isExpanded2) {
                            isExpanded2.toggle()
                            self.isExpanded = false
                            self.isExpanded1 = false
                            self.isExpanded3 = false
                            
                            
                            
                        } prompt: {
                            HStack(spacing: 0) {
                                Text("Що в FAQ?")
                                    .font(.custom("Rubik-Medium", size: 36))
                                    .foregroundColor(Color("White"))
                                Spacer()
                                Image("Plus")
                                    .rotationEffect(isExpanded2 ? Angle(degrees: 45) : .zero)
                                    .foregroundColor(Color("White"))
                            }.frame(width: 470)
                        } expandedView: {
                            
                            Text("Тут зібрані найчастіші запитання та відповіді на них про використання CRM системи. Якщо у вас є питання, яких немає у списку, зверніться до нашої служби підтримки.")
                                .font(.custom("Rubik-Medium", size: 18))
                                .frame(width: 470)
                                .foregroundColor(Color("White"))
                                .padding(.top, 50)
                            
                        }
                        Image("Line4")
                            .resizable()
                            .frame(width: 470, height: 5)
                            .foregroundColor(Color("White"))
                    }
                    
                    VStack(spacing: 27){
                        CustomDisclosureGroup(animation: .easeInOut(duration: 0.2), isExpanded: $isExpanded3) {
                            isExpanded3.toggle()
                            self.isExpanded = false
                            self.isExpanded1 = false
                            self.isExpanded2 = false
                            
                            
                            
                            
                        } prompt: {
                            HStack(spacing: 0) {
                                Text("Для чого дана CRM?")
                                    .font(.custom("Rubik-Medium", size: 36))
                                    .foregroundColor(Color("White"))
                                Spacer()
                                Image("Plus")
                                    .rotationEffect(isExpanded3 ? Angle(degrees: 45) : .zero)
                                    .foregroundColor(Color("White"))
                            }.frame(width: 470)
                        } expandedView: {
                            
                            Text("Дана СRM використовується для зручного ведення обліку відвідувань автомобілів та планування роботи з ними.")
                                .font(.custom("Rubik-Medium", size: 18))
                                .frame(width: 470)
                                .foregroundColor(Color("White"))
                                .padding(.top, 50)
                            
                        }
                        Image("Line4")
                            .resizable()
                            .frame(width: 470, height: 5)
                            .foregroundColor(Color("White"))
                    }
                    
                    
                }
            }
            Spacer()
            VStack{
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
            }.padding(.bottom, 100)
            
        }.frame(maxWidth: .infinity)
            .padding(.top, 30)
        
    }
}


@available(macOS 12.0, *)
struct FAQ_Previews: PreviewProvider {
    static var previews: some View {
        FAQ()
    }
}



