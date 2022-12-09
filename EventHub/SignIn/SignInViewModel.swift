//
//  SignInViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import SwiftUI

protocol SignInViewModelProtocol: ObservableObject {
    var mail: String {get set}
    var password: String {get set}
    var emailPrompt: String {get}
    var passwordPrompt: String {get}
    var isSignUpComplete: Bool {get}
    func close()
    func goToSignUp()
    func goToHome()
}

final class SignInViewModel: SignInViewModelProtocol {
    @Published var mail: String = ""
    @Published var password: String = ""
    
    let repository: SignInRepositoryProtocol
    let navigation: SignInNavigationProtocol
    
    init(repository: SignInRepositoryProtocol, navigation: SignInNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }

    func close() {
        navigation.onClose?()
    }
    
    func goToSignUp() {
        navigation.onGoToSignUp?()
    }
    
    func goToHome() {
        navigation.onGoToHome?()
    }

    // MARK: - Validation Functions
    
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$")
        return passwordTest.evaluate(with: password)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: mail)
    }
    
    var isSignUpComplete: Bool {
        if !isPasswordValid() || !isEmailValid() {return false} else {return true}
    }
    
    // MARK: - Validation messages
    
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
