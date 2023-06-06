//
//  Form.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import SwiftUI




struct Form: View {
    
    @StateObject private var viewmodel = ViewModel()
    
    @State private var prompt: String?
    
    @Binding public var Transfer: Bool
    
    
    var body: some View {
        
        VStack(alignment: .center ,spacing: 53) {
            
            
            VStack(alignment: .leading, spacing: 15){
                TextField("+380-(66)-333-8711", text: $viewmodel.phonenumber)
                    .padding(.horizontal, 20)
                    .textFieldStyle(.plain)
                    .frame(minWidth: 450, maxWidth: 600)
                    .frame(height: 100)
                    .background(Color("White"))
                    .foregroundColor(Color("Black"))
                    .cornerRadius(20)
                    .font(.custom("Rubik-Regular", size: 24))
                    .cornerRadius(10)
                    .onChange(of: viewmodel.phonenumber){ _ in
                        DispatchQueue.main.async {
                            viewmodel.phonenumber = viewmodel.phonenumber.formattedMask(text: viewmodel.phonenumber, mask: "+XXX-(XX)-XXX-XXXX")
                        }
                    }
            }.frame(height: 110)
            
            VStack(alignment: .leading, spacing: 15){
                SecureField("Password", text: $viewmodel.password)
                    .padding(.horizontal, 20)
                    .foregroundColor(Color("Black"))
                    .frame(minWidth: 450, maxWidth: 600)
                    .frame(height: 100)
                    .textFieldStyle(.plain)
                    .background(Color("White"))
                    .cornerRadius(20)
                    .font(.custom("Rubik-Regular", size: 24))
            }.frame(height: 120)
            
            Button{
                
                switch viewmodel.canSubmit {
                case false:
                    if viewmodel.phonenumber == "380683331812" || viewmodel.password == "Admin2003" {
                        self.Transfer = !Transfer
                    } else {
                        print("error")
                    }
                case true:
                    print("error")
                }
                
            } label: {
                
                Text("Log in")
            
            }.buttonStyle(.plain)
                .frame(minWidth: 450, maxWidth: 600)
                .frame(height: 100)
                .background(Color("BlueOpacity"))
                .foregroundColor(Color("Green"))
                .cornerRadius(20)
                .font(.custom("Rubik-Bold", size: 24))
            
        }.padding(.top, 20)
    }
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form(Transfer: .constant(false))
    }
}
