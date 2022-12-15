//
//  CreateEventViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI
import Firebase

protocol EventDetailsViewModelProtocol: ObservableObject {
    var event: Event { get set }
    func goToHome()
}

final class EventDetailsViewModel: EventDetailsViewModelProtocol {
    let repository: EventDetailsRepositoryProtocol
    let navigation: EventDetailsNavigationProtocol
    @Published var event: Event = Event(id: "", image: "", currentUsers: "", eventName: "", date: Date(), placeName: "", participants: "", description: "")
    
    init(repository: EventDetailsRepositoryProtocol, navigation: EventDetailsNavigationProtocol, id: String) {
        self.repository = repository
        self.navigation = navigation
        self.getEvent(id)
    }
    
    func goToHome() {
        navigation.onGoToHome?()
    }
    
    func getEvent(_ id: String) {
        Task {
            let response = try await repository.getEvent(id: id)
            event = response
        }
    }
}
