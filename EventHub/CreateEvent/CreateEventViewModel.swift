//
//  CreateEventViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

protocol CreateEventViewModelProtocol: ObservableObject {
    func close()
}

final class CreateEventViewModel: CreateEventViewModelProtocol {
    let repository: CreateEventRepositoryProtocol
    let navigation: CreateEventNavigationProtocol

    init(repository: CreateEventRepositoryProtocol, navigation: CreateEventNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation
    }

    func close() {
        navigation.onClose?()
    }
}
