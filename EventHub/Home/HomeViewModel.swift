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
    var popularEvents: [Event] {get set}
    var recomandedEvents: [Event] {get set}
    func createEvent()
    func eventDetails(_ id: String)
}

final class HomeViewModel: HomeViewModelProtocol {
    @Published var searchText: String = ""
    @Published var events = [Event]()
    @Published var popularEvents = [Event]()
    @Published var recomandedEvents = [Event]()
    
    let repository: HomeRepositoryProtocol
    let navigation: HomeNavigationProtocol

    init(repository: HomeRepositoryProtocol, navigation: HomeNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
        self.getEvents()
        self.getOrderPopularEvents()
        self.getRecomandedEvents()
    }
    
    func createEvent() {
        navigation.onGoToCreateEvent?()
    }
    
    func eventDetails(_ id: String) {
        navigation.onGoToEventDetails?(id)
    }
    
    func getEvents() {
        Task {
            let result = await repository.fetchEvents()
            print(result)
            events = result
        }
    }
    
    func getOrderPopularEvents() {
        Task {
            let result = await repository.orderPopularEvents()
            print(result)
            popularEvents = result
        }
    }
    
    func getRecomandedEvents() {
        Task {
            let result = await repository.recomandedEvents()
            print(result)
            recomandedEvents = result
        }
    }
}
