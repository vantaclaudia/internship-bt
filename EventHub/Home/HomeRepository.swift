//
//  HomeRepository.swift
//  EventHub
//
//  Created by Claudia Vanta on 28.11.2022.
//

import Foundation
import Firebase

protocol HomeRepositoryProtocol {
    func getUser() -> String
    func fetchEvents() async -> [Event]
}

final class HomeRepository: HomeRepositoryProtocol {
    func getUser() -> String {
        "Vanta"
    }
    
    func fetchEvents() async -> [Event] {
        let db = Firestore.firestore()
        let querySnapshot = try? await db.collection("events").getDocuments()
        let result = querySnapshot?.documents.compactMap {
            try? $0.data(as: Event.self)
        } ?? []
        return result
    }
}
