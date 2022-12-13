//
//  SignUpViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 23.11.2022.
//

import SwiftUI

protocol HomeViewModelProtocol: ObservableObject {
    var searchText: String {get set}
    var events: [Event] {get set}
    func createEvent()
    func close()
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published var searchText: String = ""
    @Published var events = [Event]()
    
    let repository: HomeRepositoryProtocol
    let navigation: HomeNavigationProtocol

    init(repository: HomeRepositoryProtocol, navigation: HomeNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
        self.getEvents()
    }

    func close() {
        navigation.onClose?()
    }
    
    func createEvent() {
        navigation.onGoToCreateEvent?()
    }
    
    func getEvents() {
        Task {
            let result = await repository.fetchEvents()
            print(result)
            events = result
        }
    }
}
