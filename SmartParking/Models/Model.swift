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


struct Questions: Identifiable {
    let id = UUID()
    let quess: String
    let answer: String
}

func fetchDataFromURL(completion: @escaping ([String: [String: Any]]?, Error?) -> Void) {
    if let url = URL(string: "http://143.47.189.24:8000/data") {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(nil, error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, NSError(domain: "Invalid response", code: 0, userInfo: nil))
                return
            }

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dictionary = json as? [String:[String: Any]] {
                        completion(dictionary, nil)
                    } else {
                        completion(nil, NSError(domain: "Unable to parse JSON", code: 0, userInfo: nil))
                    }
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    } else {
        completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
    }
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
