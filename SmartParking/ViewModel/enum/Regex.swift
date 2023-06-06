//
//  Regex.swift
//  SmartParking
//
//  Created by Denys Striltsov on 26.05.2023.
//

import Foundation

// enum визначають загальний тип групи асоціативних значень і дозволяють працювати з цими значеннями в типубезпечному режимі
enum Regex: String {
    case phone = "(\\s*)?(\\+)?([- _():=+]?\\d[- _():=+]?)?{10,14}(\\s*)?"
    case password = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$"
}
