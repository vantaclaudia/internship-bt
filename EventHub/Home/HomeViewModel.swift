//
//  SignUpViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    func close()
}

final class HomeViewModel: HomeViewModelProtocol {
    let repository: HomeRepositoryProtocol
    let navigation: HomeNavigationProtocol

    init(repository: HomeRepositoryProtocol, navigation: HomeNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }

    func close() {
        navigation.onClose?()
    }
}
