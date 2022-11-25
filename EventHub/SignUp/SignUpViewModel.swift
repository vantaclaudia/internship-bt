//
//  SignUpViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import SwiftUI

protocol SignUpViewModelProtocol: ObservableObject {
    var userName: String {get set}
    var mail: String {get set}
    var password: String {get set}
    var confirmPassword: String {get set}
    var emailPrompt: String {get}
    var confirmPrompt: String {get}
    var passwordPrompt: String {get}
    func close()
}

final class SignUpViewModel: SignUpViewModelProtocol {
    @Published var userName: String = ""
    @Published var mail: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    let repository: SignUpRepositoryProtocol
    let navigation: SignUpNavigationProtocol

    init(repository: SignUpRepositoryProtocol, navigation: SignUpNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }

    func close() {
        navigation.onClose?()
    }
    
    // MARK: - Validation Functions
    
    func passwordsMatch() -> Bool {
        password == confirmPassword
    }
    
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: mail )
    }
    
    var isSignUpComplete: Bool {
        if !passwordsMatch() || !isPasswordValid() || !isEmailValid() {return false}
            else {return true}
    }
    
    // MARK: - Validation messages
    
    var confirmPrompt: String {
        if passwordsMatch() {
            return ""
        } else {
            return "Password fields do not match"
        }
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid e-mail adress"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Must be between 8 and 15 characters containing at least one number and one capital"
        }
    }
}
