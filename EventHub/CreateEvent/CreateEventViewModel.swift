//
//  CreateEventViewModel.swift
//  EventHub
//
//  Created by Claudia Vanta on 30.11.2022.
//

import SwiftUI
import Firebase

protocol CreateEventViewModelProtocol: ObservableObject {
    var eventName: String {get set}
    var placeName: String {get set}
    var description: String {get set}
    var participants: String {get set}
    var date: Date {get set}
    func goToHome()
    func close()
    func addEventToDB()
}

final class CreateEventViewModel: CreateEventViewModelProtocol {
    @Published var eventName: String = ""
    @Published var description: String = ""
    @Published var placeName: String = "Oradea, România"
    @Published var participants = ""
    @Published var date: Date = Date()
    
    let repository: CreateEventRepositoryProtocol
    let navigation: CreateEventNavigationProtocol

    init(repository: CreateEventRepositoryProtocol, navigation: CreateEventNavigationProtocol) {
        self.repository = repository
        self.navigation = navigation

    }

    func close() {
        navigation.onClose?()
    }
    
    func goToHome() {
        navigation.onGoToHome?()
    }
    
    func addEventToDB() {
        repository.addEventToDB(eventName: eventName, date: date, placeName: placeName, participants: participants, description: description) {result in
            switch result {
            case .success:
                self.goToHome()
            case .failure(let error):
                let alert = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default) { (_) in }
                alert.addAction(ok)
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {})
            }
        }
    }
}
