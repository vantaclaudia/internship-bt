//
//  CreateEventViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI

protocol CreateEventViewModelProtocol: ObservableObject {
    var eventName: String {get set}
    var description: String {get set}
    var participants: String {get set}
    func close()
}

final class CreateEventViewModel: CreateEventViewModelProtocol {
    @Published var eventName: String = ""
    @Published var description: String = ""
    @Published var participants: String = ""
    
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
