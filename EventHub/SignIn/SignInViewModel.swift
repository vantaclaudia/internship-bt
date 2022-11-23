//
//  SignInViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 22.11.2022.
//

import SwiftUI

protocol SignInViewModelProtocol: ObservableObject {
    func close()
}

final class SignInViewModel: SignInViewModelProtocol {
    @Published var users = [String]()
    let repository: SignInRepositoryProtocol
    let navigation: SignInNavigationProtocol

    init(repository: SignInRepositoryProtocol, navigation: SignInNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }

    func getUsers() {
        let user = repository.getUser()
        users = [user]
    }

    func close() {
        navigation.onClose?()
    }
}
