//
//  Main.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import SwiftUI


@available(macOS 12.0, *)
struct Main: View {
    
    @State var selection: Int = 0
    @Binding public var Transfer: Bool
    
    var body: some View {
        VStack(spacing: 0){
            Header()
            HStack(spacing: 0) {
                SideBar(selection: $selection.animation(), Transfer: $Transfer.animation())
                switch selection {
                    case 0:
                        Dashboard()
                    case 1:
                        Booking()
                    case 2:
                        FAQ()
                default:
                    Text("Error")
                }
               
                
            }

        }
    }
}


@available(macOS 12.0, *)
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main( Transfer: .constant(false))
    }
}
