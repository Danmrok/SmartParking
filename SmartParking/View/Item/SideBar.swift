//
//  SideBar.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//


import SwiftUI




@available(macOS 12.0, *)
struct SideBar: View {
    
    
    @Binding public var selection: Int
    @Binding public var Transfer: Bool
    
    let options = [
        Option(id: 0, title: "Dashboard", ImageName: "Dashboard"),
        Option(id: 1, title: "Booking", ImageName: "Booking"),
        Option(id: 2, title: "FAQ", ImageName: "FAQ"),
    ]
    
    
    
    var body: some View {
        VStack(spacing: 0){
            VStack(spacing: 0){
                ForEach(options, id: \.self) { option in
                    Button(action: {
                        self.selection = option.id
                    }, label: {
                        HStack(spacing: 19) {
                            Image("\(option.ImageName)")
                                .resizable()
                                .frame(width: 27, height: 27)
                                .foregroundStyle(selection == option.id ? Color("White") : Color("Green"))
                            Text(option.title)
                                .font(.custom("Rubik-Regular", size: 18))
                                .foregroundColor(selection == option.id ? Color("White") : Color("Green"))
                            
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }.frame(maxHeight: 120)
                            .padding(.leading, 20)
                            .background(selection == option.id ?
                                        LinearGradient(gradient: Gradient(colors: [Color("SemiDarkBlue").opacity(0.3), Color("SemiDarkBlue")]), startPoint: .leading, endPoint: .trailing) :
                                            nil
                            )
                    })
                    .buttonStyle(.plain)
                    
                }
                
            }
            Spacer()
            
            Button(action: {
                self.Transfer = !Transfer
            }, label: {
                HStack (spacing: 19){
                    Image("Exit")
                        .resizable()
                        .frame(width: 27, height: 27)
                    Text("Exit")
                        .font(.custom("Rubik-Regular", size: 18))
                        .foregroundColor(Color("Green"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }).buttonStyle(.plain)
                .frame(maxHeight: 120)
                .padding(.leading, 20)
            
            
            
        }.frame(width: 200)
            .frame(minHeight: 650, maxHeight: .infinity)
            .background(Color("BlueOpacity"))
    }
}




@available(macOS 12.0, *)
struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar(selection: .constant(0), Transfer: .constant(false))
    }
}
