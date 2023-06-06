//
//  Header.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import SwiftUI

struct Header: View {
    var body: some View {

            HStack(spacing: 0){
                Logo()
                    .padding(.leading, 20)
                Spacer()
                Image("Logo")
                    .padding(.trailing, 20)
            }.frame(minWidth: 1024, maxWidth: .infinity)
            .frame(height: 150)
                .background(Color("BlueOpacity"))
      
            
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
