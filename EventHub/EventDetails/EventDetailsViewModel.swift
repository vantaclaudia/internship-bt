//
//  CreateEventViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI
import Firebase

protocol EventDetailsViewModelProtocol: ObservableObject {

}

final class EventDetailsViewModel: EventDetailsViewModelProtocol {
    let repository: EventDetailsRepositoryProtocol
    let navigation: EventDetailsNavigationProtocol

    init(repository: EventDetailsRepositoryProtocol, navigation: EventDetailsNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation

    }
}
