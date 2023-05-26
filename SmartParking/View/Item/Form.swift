//
//  Form.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import Foundation
import SwiftUI
import Combine



struct Form: View {
    
    @StateObject private var viewmodel = ViewModel()
    
    
//    @State private var PhoneNumber : String = ""
//    @State private var Password : String = ""
    @State private var prompt: String?
    
    @Binding public var Transfer: Bool
    
    //    init(prompt: String? = nil) {
    //
    //        self.prompt = prompt
    //    }
    
    
    
    var body: some View {
        
        VStack(alignment: .center ,spacing: 53) {
            
            
            VStack(alignment: .leading, spacing: 15){
                TextField("+380-(66)-333-8711", text: $viewmodel.phonenumber)
                //                .modifier(PhoneNumberFormatter(text: PhoneNumber))
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
                
                if viewmodel.canSubmit == false {
                    if viewmodel.phonenumber == "380683331812" || viewmodel.password == "Admin2003" {
                        self.Transfer = !Transfer
                    }
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


//struct PhoneNumberFormatter: ViewModifier {
//    @Binding var text: String
//
//    func body(content: Content) -> some View {
//        content
//            .onReceive(Just(text)) { newValue in
//                let formattedText = formatPhoneNumber(newValue)
//                self.text = formattedText
//            }
//    }
//
//    private func formatPhoneNumber(_ text: String) -> String {
//        let cleanedText = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
//        var formattedText = ""
//
//        guard cleanedText.count >= 10 else {
//            return cleanedText
//        }
//
//        let countryCode = cleanedText.prefix(3)
//        let firstGroup = cleanedText[cleanedText.index(cleanedText.startIndex, offsetBy: 3)..<cleanedText.index(cleanedText.startIndex, offsetBy: 5)]
//        let secondGroup = cleanedText[cleanedText.index(cleanedText.startIndex, offsetBy: 5)..<cleanedText.index(cleanedText.startIndex, offsetBy: 8)]
//        let thirdGroup = cleanedText[cleanedText.index(cleanedText.startIndex, offsetBy: 8)..<cleanedText.endIndex]
//
//        formattedText = String(String("+\(countryCode)-(\(firstGroup))-\(secondGroup)-\(thirdGroup)").prefix(18))
//
//        return formattedText
//    }
//}
