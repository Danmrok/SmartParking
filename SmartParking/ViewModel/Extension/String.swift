//
//  String.swift
//  SmartParking
//
//  Created by Denys Striltsov on 26.05.2023.
//

import Foundation


// Розширення дозволяють додавати методи до існуючих типів, щоб змусити їх виконувати те, для чого вони спочатку не були розроблені
extension String {
    func formattedMask(text: String, mask: String?) -> String {
        let cleanPhoneNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanPhoneNumber.startIndex
        if let mask = mask {
            for ch in mask where index < cleanPhoneNumber.endIndex {
                if ch == "X" {
                    result.append(cleanPhoneNumber[index])
                    index = cleanPhoneNumber.index(after: index)
                } else {
                    result.append(ch)
                }
            }
        }
        return result
    }
}
