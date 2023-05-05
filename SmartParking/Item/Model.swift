//
//  Model.swift
//  SmartParking
//
//  Created by Denys Striltsov on 06.02.2023.
//

import Foundation
import SwiftUI

struct Option: Hashable {
    let id: Int
    let title: String
    let ImageName: String
}

struct Person: Identifiable {
    let customerName: String
    let PhoneNumber: String
    let marknumber: String
    let markcar: String
    let datein: String
    let dateout: String
    let id = UUID()
}


struct Questions: Identifiable {
    let id = UUID()
    let quess: String
    let answer: String
}






struct CustomDisclosureGroup<Prompt: View, ExpandedView: View>: View {
    
    @Binding var isExpanded: Bool

    var actionOnClick: () -> ()
    var animation: Animation?
    
    let prompt: Prompt
    let expandedView: ExpandedView
    
    init(animation: Animation?, isExpanded: Binding<Bool>, actionOnClick: @escaping () -> (), prompt: () -> Prompt, expandedView: () -> ExpandedView) {
        self.actionOnClick = actionOnClick
        self._isExpanded = isExpanded
        self.animation = animation
        self.prompt = prompt()
        self.expandedView = expandedView()
}
    
    var body: some View {
        VStack(spacing: 0) {
            prompt
            
            if isExpanded{
                expandedView
            }
        }
        .clipped()
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(animation) {
                actionOnClick()
            }
        }
    }
}
