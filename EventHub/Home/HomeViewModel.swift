//
//  SignUpViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var searchText: String {get set}
    func createEvent()
    func close()
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published var searchText: String = ""
    
    let repository: HomeRepositoryProtocol
    let navigation: HomeNavigationProtocol

    init(repository: HomeRepositoryProtocol, navigation: HomeNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }

    func close() {
        navigation.onClose?()
    }
    
    func createEvent() {
        navigation.onGoToCreateEvent?()
    }
}
