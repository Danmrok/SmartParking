//
//  ViewModel.swift
//  SmartParking
//
//  Created by Denys Striltsov on 05.05.2023.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var phonenumber = ""
    @Published var password = ""
    @Published var canSubmit = false
    
    @Published var isPhoneNumberCriteriaValid = false
    @Published var isPasswordCriteriaValid = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private let phonenumberPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.phone.rawValue)
    
    private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.password.rawValue)
    
    init() {
        $phonenumber
            .debounce(for: 0.05, scheduler: RunLoop.main)
            .map { email in
                return self.phonenumberPredicate.evaluate(with: email)
            }
            .assign(to: \.isPhoneNumberCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .debounce(for: 0.05, scheduler: RunLoop.main)
            .map { password in
                return self.passwordPredicate.evaluate(with: password)
            }
            .assign(to: \.isPasswordCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        
        Publishers.CombineLatest($isPhoneNumberCriteriaValid, $isPasswordCriteriaValid)
            .map { isEmailCriteriaValid, isPasswordCriteriaValid in
                return (isEmailCriteriaValid && isPasswordCriteriaValid)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }
    
    var phonenumberPrompt: String? {
        if phonenumber.isEmpty || isPhoneNumberCriteriaValid == true {
            return nil
        } else {
            return "Введіть правильний номер телефону"
        }
          
    }
    
    var passwordPrompt: String? {
        if password.isEmpty || isPasswordCriteriaValid == true {
            return nil
        } else {
            return "Введіть правильний пароль. Приклад: Admin1111"
        }
    }
}
