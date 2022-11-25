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
    
    func close()
//    func goToSignUp()
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
}
