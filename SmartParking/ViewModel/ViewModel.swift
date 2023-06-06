//
//  ViewModel.swift
//  SmartParking
//
//  Created by Denys Striltsov on 05.05.2023.
//


import Combine
import Foundation

class ViewModel: ObservableObject {
    
    // Створення публічних змінних
    @Published var phonenumber = ""
    @Published var password = ""
    @Published var canSubmit = false
    
    // Створення публічних змінних котрі будуть відповідати за валідність
    @Published var isPhoneNumberCriteriaValid = false
    @Published var isPasswordCriteriaValid = false
    
    // Створення публічної змінної для зберігання даних наданих з сервера
    @Published var dictionary: [String: [String: Any]] = [:]
   
    // Створення приватних змінних, котрі будуть відповідати за зберігання даних під час їх обробки
    private var cancellableSet: Set<AnyCancellable> = []
    private var cancellables = Set<AnyCancellable>()
    
    // Створення приватних змінних, котрі будуть відповідати за правильність формату введених даних
    private let phonenumberPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.phone.rawValue)
    private let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", Regex.password.rawValue)
    
    init() {
        // Ініціалізація номера телефону та перевірка на правильність його формату
        $phonenumber
            .debounce(for: 0.05, scheduler: RunLoop.main)
            .map { email in
                return self.phonenumberPredicate.evaluate(with: email)
            }
            .assign(to: \.isPhoneNumberCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        // Ініціалізація паролю та перевірка на правильність його формату
        $password
            .debounce(for: 0.05, scheduler: RunLoop.main)
            .map { password in
                return self.passwordPredicate.evaluate(with: password)
            }
            .assign(to: \.isPasswordCriteriaValid, on: self)
            .store(in: &cancellableSet)
        
        // Ініціалізація на валідність номера телефону та паролю одночасно
        Publishers.CombineLatest($isPhoneNumberCriteriaValid, $isPasswordCriteriaValid)
            .map { isEmailCriteriaValid, isPasswordCriteriaValid in
                return (isEmailCriteriaValid && isPasswordCriteriaValid)
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }
    
    var phonenumberPrompt: String? {
        // Перевірка на правильність написання номера телефону з допомогою валідності
        if phonenumber.isEmpty || isPhoneNumberCriteriaValid == true {
            return nil
        } else {
            return "Введіть правильний номер телефону"
        }
        
    }
    
    var passwordPrompt: String? {
        // Перевірка на правильність написання паролю з допомогою валідності
        if password.isEmpty || isPasswordCriteriaValid == true {
            return nil
        } else {
            return "Введіть правильний пароль. Приклад: Admin1111"
        }
    }
    
    func fetchData() {
        
        guard let url = URL(string: "http://143.47.189.24:8000/data") else {
            // Перевірка на роботу URL адреси
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .tryMap { data -> [String: [String: Any]] in
                // Спеціальна логіка декодування для кожного значення словника
                guard let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                    // Обробка помилок декодування JSON
                    throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Failed to decode JSON"))
                }
                
                var decodedDictionary: [String: [String: Any]] = [:]
                
                for (key, value) in jsonDictionary {
                    if let nestedDictionary = value as? [String: Any] {
                        decodedDictionary[key] = nestedDictionary
                    }
                }
                
                return decodedDictionary
            }
            .sink(receiveCompletion: { completion in
                // Обробка завершеного запиту, якщо необхідно
            }, receiveValue: { [weak self] response in
                // Оновлення даних котрі надходять з серверу
                DispatchQueue.main.async {
                    self?.dictionary = response
                }
            })
            .store(in: &cancellables)
    }
    
    
}
