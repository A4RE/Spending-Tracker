//
//  RegisterViewModel.swift
//  Expense Tracker
//
//  Created by Андрей Коваленко on 14.06.2024.
//

import Foundation
import Combine

final class RegisterViewModel: ObservableObject {
    
    @Published var profileName = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    @Published var textFieldsAreFull = Bool()
    @Published var passwordsAreEqual = Bool()
    @Published var showAlert = Bool()
    @Published var shouldNavigateToTabBar = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        checkTextFields()
    }
    
    func checkTextFields() {
        Publishers.CombineLatest3($profileName, $password, $confirmPassword)
            .map { profileName, password, confirmPassword in
                return !profileName.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
            }
            .assign(to: \.textFieldsAreFull, on: self)
            .store(in: &cancellables)
    }
    
    func checkPasswords() {
        passwordsAreEqual = (password == confirmPassword)
        if passwordsAreEqual {
            shouldNavigateToTabBar = true
        } else {
            showAlert = true
        }
    }
}
